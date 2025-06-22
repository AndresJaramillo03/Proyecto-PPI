import sql from 'mssql';
import bcrypt from 'bcryptjs';
import { getConnection } from '../config/Connection.js';

const loginUser = async (req, res) => {
  const { usuario, contrasena } = req.body;

  try {
    const pool = await getConnection;
    const result = await pool
      .request()
      .input('usuario', sql.VarChar, usuario)
      .query('SELECT * FROM usuario WHERE nombre_completo = @usuario');

    if (result.recordset.length === 0) {
      return res.status(401).json({ success: false, message: 'Usuario no encontrado' });
    }

    const user = result.recordset[0];

    const passwordMatch = await bcrypt.compare(contrasena, user.contraseña_usuario);

    if (!passwordMatch) {
      return res.status(401).json({ success: false, message: 'Contraseña incorrecta' });
    }

    res.json({ success: true, usuario: user });
  } catch (error) {
    console.error('Error al iniciar sesión:', error);
    res.status(500).json({ success: false, message: 'Error en el servidor' });
  }
};

export { loginUser };