import './App.css';
import Footer from './components/Footer';
import Header from './components/Header';
import Home from './pages/Home';
import MasSobreIA from './pages/MasSobreIA';
import AcercaDe from './pages/AcercaDe';
import {BrowserRouter as Router, Routes, Route} from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';


function App() {
  return (
    <Router>
      <Header />
      <Routes>
        <Route path= '/' element={ <Home />}/>
        <Route path='/MasSobreIA' element={<MasSobreIA />}/>
        <Route path='/AcercaDe' element={<AcercaDe />}/>
      </Routes>
      <Footer />
    </Router>
  );
}

export default App;