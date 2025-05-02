import { useState } from 'react'
import './App.css'
import './App.css';
import Footer from './components/Footer';
import Header from './components/Header';
import Home from './pages/Home';
import About from './pages/About';
import Articles from './pages/Articles';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  const [count, setCount] = useState(0)

  return (
    <div>
    <Router>
      <Header />
      <Routes>
        <Route path= '/' element={ <Home />}/>
        <Route path='/Articles' element={<Articles />}/>
        <Route path='/About' element={<About />}/>
      </Routes>
      <Footer />
    </Router>
    </div>
  )
}

export default App
