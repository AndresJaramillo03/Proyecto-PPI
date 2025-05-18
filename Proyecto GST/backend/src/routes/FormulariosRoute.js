import { getAllF, insertForm } from "../controller/FormsController.js";
import express from 'express'

const router = express.Router()

router.get('/SeeFrom', getAllF)

router.post('/Forms', insertForm)

export default router;