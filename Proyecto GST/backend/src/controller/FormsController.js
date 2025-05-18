import { getAllFormularios, insertFormularios } from "../model/FormularioModel.js";

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

export {getAllF, insertForm};