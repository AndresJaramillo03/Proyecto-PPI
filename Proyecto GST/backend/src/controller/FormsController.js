import { getAllFormularios, insertFormularios, deleteFormulario, actualizarFormularioPorId } from "../model/FormularioModel.js";

const getAllF = async (req,res) =>{
    try{

        const formularios = await getAllFormularios()
        res.json(formularios)

    }catch (error) {

        res.status(500).json({messager: error.message})

    }
}

const insertForm = async (req, res) =>{
    try {
        await insertFormularios(req.body)
        res.status(201).json({message: 'Formulario registrado'})
    } catch (error) {
        res.status(500).json({message: error.message})
    }

}

const deleteForm = async (req, res) => {
    try {
        const id_pregunta = parseInt(req.params.id_pregunta);
        await deleteFormulario({ id_pregunta });
        res.status(200).json({ message: 'Formulario eliminado' });
    } catch (error) {
        console.error('Error en deleteForm:', error);
        res.status(500).json({ message: error.message });
    }
};

const actualizarFormulario = async (req, res) => {
  try {
    const { id } = req.params;
    const datos = req.body;
    await actualizarFormularioPorId(id, datos);
    res.status(200).json({ mensaje: 'Formulario actualizado correctamente' });
  } catch (error) {
    console.error('Error al actualizar:', error);
    res.status(500).json({ mensaje: 'Error al actualizar el formulario' });
  }
};

export {getAllF, insertForm, deleteForm, actualizarFormulario};