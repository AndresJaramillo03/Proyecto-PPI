import { getAllF, insertForm, deleteForm, actualizarFormulario } from "../controller/FormsController.js";
import express from 'express';

const router = express.Router();
router.get('/SeeFrom', getAllF);
router.post('/Forms', insertForm);
router.delete('/:id_pregunta', deleteForm);
router.put('/:id', actualizarFormulario);

export default router;