import jwt from 'jsonwebtoken'
import bcrypt from 'bcryptjs'
import { insertUser, findUserByCorreo} from '../model/UserModel.js'

const SECRET_KEY = 'Ca25jt53**'

export const insertU = async (req, res) => {
  const { nombre_completo, correo, contrasena } = req.body

  if (!nombre_completo || !correo || !contrasena) {
    return res.status(400).json({ message: "Todos los campos son obligatorios" })
  }

  try {
    await insertUser({ nombre_completo, correo, contrasena })
    res.status(201).json({ message: "Usuario registrado correctamente" })
  } catch (error) {
    console.error("Error en insertU:", error);
    res.status(500).json({ message: "Error al registrar usuario", error })
  }

  
}

export const login = async (req, res) => {
  const { correo, contrasena } = req.body;

  if (!correo || !contrasena) {
    return res.status(400).json({ message: "Correo y contraseña son obligatorios" });
  }

  try {
    const user = await findUserByCorreo(correo);

    if (!user) {
      return res.status(404).json({ message: "Usuario no encontrado" });
    }

    const isMatch = await bcrypt.compare(contrasena, user.contraseña);

    if (!isMatch) {
      return res.status(401).json({ message: "Contraseña incorrecta" });
    }

    const token = jwt.sign(
      {
        id: user.id || user.usuario_id,
        nombre: user.nombre_completo,
        correo: user.correo,
        rol: user.id_perfil || user.rol_id || null
      },
      SECRET_KEY,
      { expiresIn: '2h' }
    );

    res.json({
      message: "Login exitoso",
      token,
      user: {
        id: user.id || user.usuario_id,
        nombre_completo: user.nombre_completo,
        correo: user.correo,
        rol: user.id_perfil || user.rol_id || null
      }
    });

  } catch (error) {
    console.error("Error en login:", error);
    res.status(500).json({ message: "Error en el login", error });
  }
};