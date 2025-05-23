import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import fondoHome from "../assets/fondo-home.jpg";
import "../css/loginForm.css";
import axios from "axios";
import Swal from "sweetalert2";

export default function Register() {
  const navigate = useNavigate();
  const [form, setForm] = useState({
    nombre_completo: "",
    correo: "",
    contrasena: "",
    confirm: "",
  });
  const [error, setError] = useState("");

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

const handleSubmit = async (e) => {
  e.preventDefault();
  setError("");

  if (form.contrasena !== form.confirm) {
    setError("Las contraseñas no coinciden");
    return;
  }

  try {
    const response = await axios.post("http://localhost:3000/Register", {
      nombre_completo: form.nombre_completo,
      correo: form.correo,
      contrasena: form.contrasena,
    });

    Swal.fire("¡Éxito!", "Usuario registrado correctamente", "success");
    navigate("/login");
  } catch (error) {
    console.error(error);
    setError(
      error.response?.data?.message || "Error al registrarse. Intenta nuevamente."
    );
  }
};

  return (
    <div
      className="login-wrapper"
      style={{
        backgroundImage: `url(${fondoHome})`,
        backgroundSize: "cover",
        backgroundPosition: "center",
        width: "100vw",
        height: "100vh",
        display: "flex",
        alignItems: "center",
        justifyContent: "center",
      }}
    >
      <form onSubmit={handleSubmit} className="login-card text-center">
        <h2 className="mb-4">REGÍSTRATE</h2>

        {error && (
          <p className="mb-3" style={{ color: "red" }}>
            {error}
          </p>
        )}

        <input
          name="nombre_completo"
          type="text"
          className="login-input mb-3"
          placeholder="Nombre completo"
          value={form.nombre_completo}
          onChange={handleChange}
          required
        />

        <input
          name="correo"
          type="email"
          className="login-input mb-3"
          placeholder="Correo electrónico"
          value={form.correo}
          onChange={handleChange}
          required
        />

        <input
          name="contrasena"
          type="password"
          className="login-input mb-3"
          placeholder="Contraseña"
          value={form.contrasena}
          onChange={handleChange}
          required
        />

        <input
          name="confirm"
          type="password"
          className="login-input mb-3"
          placeholder="Confirma tu contraseña"
          value={form.confirm}
          onChange={handleChange}
          required
        />

        <button type="submit" className="login-button mb-3">
          REGISTRARSE
        </button>

        <p>
          ¿Ya tienes cuenta?{" "}
          <Link to="/login" style={{ color: "#009fab" }}>
            Inicia sesión
          </Link>
        </p>
      </form>
    </div>
  );
}