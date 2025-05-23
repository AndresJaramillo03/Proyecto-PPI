import bcrypt from "bcryptjs";
import { getConnection } from "../config/Connection.js";

const insertUser = async (user) => {
  const { nombre_completo, contrasena, correo } = user;

  const hashedContrasena = await bcrypt.hash(contrasena, 10);
  const connection = await getConnection;

  await connection.request()
    .input('nombre_completo', nombre_completo)
    .input('correo', correo)
    .input('contraseña_usuario', hashedContrasena)
    .execute('sp_crear_usuario');
};

const findUserByCorreo = async (correo) => {
  const connection = await getConnection();
  const result = await connection.request()
    .input('correo', correo)
    .query('SELECT * FROM Usuario WHERE correo = @correo');

  return result.recordset[0]; 
};

export { insertUser, findUserByCorreo };