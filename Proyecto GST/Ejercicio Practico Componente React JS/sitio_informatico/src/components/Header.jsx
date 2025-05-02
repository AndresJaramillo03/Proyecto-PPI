import React from 'react'
import '../style/Header.css';
import { Link } from 'react-router-dom';

export default function Header() {
  return (
    <div className='container-fluid divPadre'>
      <div className='tituloPagina'>
        <h2>TENDENCIAS DE LA TECNOLOGIA</h2>
      </div>
      <div className='row m-3 contenedorBotones'>
        <Link to={'/'} className=' p-1 m-1 claseBoton' type="button" >HOME</Link>
        <Link to={'/Articles'} className=' p-1 m-1 claseBoton' type="button" >ARTICULOS</Link>
        <Link to={'/About'} className=' p-1 m-1 claseBoton' type="button" >ACERCA DE</Link>
      </div>
    </div>
  )
}