import { insertU } from "../controller/AuthController";
import express from "express";

const router = express.Router()
router.post('/Register', insertU)
export default router;