import { getAllF, postF } from "../controller/FormsController.js";
import express from 'express'

const router = express.Router()

router.get('/', getAllF)
router.post('/', postF)

export default router;