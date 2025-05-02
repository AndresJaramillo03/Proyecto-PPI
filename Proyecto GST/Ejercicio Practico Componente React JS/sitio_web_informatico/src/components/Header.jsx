import React from 'react';
import Home from '../pages/Home';
import MasSobreIA from '../pages/MasSobreIA';
import AcercaDe from '../pages/AcercaDe';
import '../style/Header.css';
import { Link } from 'react-router-dom';

export default function Header() {
  return (
    <div className='container-fluid divPadre'>
      <div className='tituloPagina'>
        <h2>WEB INFORMATICO</h2>
      </div>
      <div className='row m-3 contenedorBotones'>
        <Link to={'/'} className=' p-1 m-1 claseBoton' type="button" >HOME</Link>
        <Link to={'/MasSobreIA'} className=' p-1 m-1 claseBoton' type="button" >MAS SOBRE IA</Link>
        <Link to={'/AcercaDe'} className=' p-1 m-1 claseBoton' type="button" >ACERCA DE</Link>
      </div>
    </div>
  )
}