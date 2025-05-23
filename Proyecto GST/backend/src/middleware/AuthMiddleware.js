import jwt from 'jsonwebtoken'

const SECRET_KEY = 'tu_clave_secreta_super_segura'

export const verificarToken = (req, res, next) => {
  const token = req.headers['authorization']
  if (!token) return res.status(403).json({ message: 'Token no proporcionado' })

  try {
    const decoded = jwt.verify(token, SECRET_KEY)
    req.usuario = decoded
    next()
  } catch (err) {
    res.status(401).json({ message: 'Token inválido o expirado' })
  }
}

export const esAdmin = (req, res, next) => {
  if (req.usuario.rol !== 2) {
    return res.status(403).json({ message: 'Acceso restringido solo para administradores' })
  }
  next()
}