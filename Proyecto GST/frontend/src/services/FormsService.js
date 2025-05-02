import axios from 'axios'

const api = 'https:localhost:3000/Litar'

export const ObtenerFormularios = async()=>{
    const listado = await axios.get(api)
    return listado.data
}