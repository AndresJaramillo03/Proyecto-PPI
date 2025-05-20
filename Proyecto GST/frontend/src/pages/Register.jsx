import React, { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import fondoHome from "../assets/fondo-home.png";
import "../css/registerForm.css";

export default function Register() {
  const [form, setForm] = useState({
    nombre: "",
    email: "",
    password: "",
    confirm: "",
  });
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleChange = (e) =>
    setForm({ ...form, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (form.password !== form.confirm) {
      setError("Las contraseñas no coinciden");
      return;
    }
    try {
      navigate("/login");
    } catch (err) {
      setError("Error al registrarse");
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
      <form
        onSubmit={handleSubmit}
        className="login-card text-center"
      >
        <h2 className="mb-4">REGÍSTRATE</h2>

        {error && (
          <p className="mb-3" style={{ color: "red" }}>
            {error}
          </p>
        )}

        <input
          name="nombre"
          type="text"
          className="login-input mb-3"
          placeholder="Nombre completo"
          value={form.nombre}
          onChange={handleChange}
          required
        />

        <input
          name="email"
          type="email"
          className="login-input mb-3"
          placeholder="Correo electrónico"
          value={form.email}
          onChange={handleChange}
          required
        />

        <input
          name="password"
          type="password"
          className="login-input mb-3"
          placeholder="Contraseña"
          value={form.password}
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

        <button
          type="submit"
          className="login-button mb-3"
        >
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