import express from 'express';
const router = express.Router();
import  { loginUser } from '../controller/LoginController.js';

router.post('/login', loginUser);

export default router;