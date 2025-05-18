import axios from 'axios'

const api = 'http://localhost:3000/SeeFrom'

export const ObtenerFormulario = async()=>{
    const listado = await axios.get(api)
    return listado.data
}