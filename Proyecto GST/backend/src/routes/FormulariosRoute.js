import { getAllF } from "../controller/FormsController.js";
import express from 'express'

const router = express.Router()

router.get('/', getAllF)

export default router;