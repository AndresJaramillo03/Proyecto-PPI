import { getAllFormularios } from "../model/Formulario.js";

const getAllF = async (req,res) =>{
    try{

        const formularios = await getAllFormularios()
        res.json(formularios)

    }catch (error) {

        res.status(500).json({messager: error.messager})

    }
}

export {getAllF}