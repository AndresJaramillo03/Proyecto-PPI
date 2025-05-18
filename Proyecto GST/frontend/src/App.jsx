import {BrowserRouter as Router,Routes, Route } from 'react-router-dom'
import Header from './components/Header'
import Footer from './components/Footer'
import Forms from './pages/Forms'
import Home from './pages/Home'
import Login from './pages/Login'
import 'bootstrap/dist/css/bootstrap.min.css';
import SeeFrom from './pages/SeeFrom'

function App() {

  return (
    <Router>
      <Header />
      <Routes>
        <Route path='/' element={<Home />}/>
        <Route path='/Login' element={<Login />}/>
        <Route path='/Forms' element={<Forms />}/>
        <Route path='/SeeFrom' element={<SeeFrom />}/>
      </Routes>
  </Router>
  )
}

export default App