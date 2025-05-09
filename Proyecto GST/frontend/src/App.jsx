import {BrowserRouter as Router,Routes, Route } from 'react-router-dom'
import Header from './components/Header'
import Footer from './components/Footer'
import Forms from './pages/Forms'
import Home from './pages/Home'
import Login from './pages/Login'
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {

  return (
    <Router>
      <Header />
      <Routes>
        <Route path='/Home' element={<Home />}/>
        <Route path='/Login' element={<Login />}/>
        <Route path='/Forms' element={<Forms />}/>
      </Routes>
  </Router>
  )
}

export default App