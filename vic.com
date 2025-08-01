¡Aquí lo tienes, Victor! 🧘‍♂️🌐 Tu archivo completo de zona_juego_sensorial_dinamico_vFinal.html, listo para copiar, guardar y ejecutar desde tu navegador:

<details> <summary>📄 Haz clic aquí para desplegar el código completo</summary>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Sesión Zen con Logros 🌀</title>
  <style>
    body {
      background-color: #0b0f19;
      color: #f1f5f9;
      font-family: sans-serif;
      text-align: center;
      padding: 2em;
    }
    h1 { color: #60a5fa; margin-bottom: 1em; }
    .boton {
      background-color: #1d4ed8;
      border: none;
      color: white;
      padding: 1.2rem 2.4rem;
      margin: 0.7rem;
      border-radius: 10px;
      font-size: 1.2rem;
      cursor: pointer;
      transition: all 0.3s ease;
    }
    .boton:hover {
      background-color: #1e40af; transform: scale(1.1); }
    .boton:active {
      background-color: #1d4ed8; transform: scale(0.9); }
    .mensaje { font-size: 1.4rem; margin-top: 1.2em; }

    .esfera, .burbuja {
      width: 140px;
      height: 140px;
      border-radius: 50%;
      margin: 2.5em auto;
      background-color: #2563eb;
      box-shadow: 0 0 30px #2563eb;
    }
    .esfera { animation: latidoLento 2.5s infinite ease-in-out; }
    .burbuja {
      animation: respiracion 5s infinite ease-in-out;
      display: none;
      background-color: #0ea5e9;
    }

    @keyframes latidoLento {
      0% { transform: scale(1); opacity: 0.6; }
      50% { transform: scale(1.5); opacity: 1; }
      100% { transform: scale(1); opacity: 0.6; }
    }
    @keyframes respiracion {
      0% { transform: scale(1); opacity: 0.7; }
      25% { transform: scale(1.4); opacity: 1; }
      50% { transform: scale(1.8); opacity: 0.9; }
      75% { transform: scale(1.4); opacity: 1; }
      100% { transform: scale(1); opacity: 0.7; }
    }

    @keyframes latidoNormal {
      0% { transform: scale(1); opacity: 0.6; }
      50% { transform: scale(1.4); opacity: 1; }
      100% { transform: scale(1); opacity: 0.6; }
    }

    @keyframes latidoRapido {
      0% { transform: scale(1); opacity: 0.6; }
      50% { transform: scale(1.3); opacity: 1; }
      100% { transform: scale(1); opacity: 0.6; }
    }

    @keyframes latidoExtremo {
      0% { transform: scale(1); opacity: 0.6; }
      50% { transform: scale(1.3); opacity: 1; }
      100% { transform: scale(1); opacity: 0.6; }
    }

    @keyframes animacionFinal {
      0% { transform: scale(1); opacity: 1; }
      25% { transform: scale(1.3); opacity: 0.9; }
      50% { transform: scale(1.7); opacity: 0.7; }
      75% { transform: scale(1.3); opacity: 0.9; }
      100% { transform: scale(1); opacity: 1; }
    }

    @keyframes auraSuave {
      0% { box-shadow: 0 0 30px #2563eb; }
      50% { box-shadow: 0 0 50px #60a5fa; }
      100% { box-shadow: 0 0 30px #2563eb; }
    }

    @keyframes desvanecimiento {
      0% { opacity: 1; transform: scale(1); }
      100% { opacity: 0; transform: scale(0.8); }
    }

    #logros { margin-top: 1.8em; font-size: 1.4rem; color: #fde047; }
    #continuarBtn, #nivelBtn {
      display: none;
      margin-top: 1.2em;
    }

    .progreso {
      width: 100%;
      height: 25px;
      background-color: #0f172a;
      border-radius: 12px;
      overflow: hidden;
      margin-top: 1.2em;
    }
    .barra {
      height: 100%;
      background-color: #3b82f6;
      width: 0%;
      transition: width 0.4s ease;
    }
  </style>
</head>
<body>
  <h1>🌀 Zona Zen Dinámica</h1>
  <p>Elige tu nivel mental:</p>
  <button class="boton" onclick="iniciar('facil')" style="background-color: #28a745;">🟢 Relajación (75 min)</button>
  <button class="boton" onclick="iniciar('medio')" style="background-color: #ffc107;">🔥 Activación (135 min)</button>
  <button class="boton" onclick="iniciar('dificil')" style="background-color: #dc3545;">💀 Estímulo (180 min)</button>
  <button class="boton" onclick="iniciar('extremo')" style="background-color: #6f42c1;">🚨 Control Absoluto (195 min)</button>
  <button class="boton" onclick="iniciar('rapido')" style="background-color: #17a2b8;">⚡ Avance Rápido (Nivel Difícil)</button>
  <button class="boton" onclick="iniciar('mar_on_fire_1')" style="background-color: #fd7e14;">🔥 Mar on Fire 1 (10 min)</button>
  <button class="boton" onclick="iniciar('mar_on_fire_2')" style="background-color: #fd7e14;">🔥 Mar on Fire 2 (10 min)</button>
  <button class="boton" onclick="iniciar('mar_on_fire_3')" style="background-color: #fd7e14;">🔥 Último Asalto: Mente al Límite (10 min)</button>
  <button class="boton" onclick="iniciar('xtremo_1')" style="background-color: #343a40;">🚨 Xtremo .1 (200 min)</button>
  <button class="boton" onclick="iniciar('rapidin_1')" style="background-color: #e83e8c;">⚡ Rapidín Extremo 1 (5 min)</button>
  <button class="boton" onclick="iniciar('rapidin_2')" style="background-color: #e83e8c;">⚡ Rapidín Extremo 2 (5 min)</button>
  <button class="boton" onclick="activarMarOnFire3()">🔥 Activar Último Asalto al abrir</button>

  <div id="estado" class="mensaje"></div>
  <div class="esfera" id="esfera"></div>
  <div class="burbuja" id="burbujaRespiracion"></div>
  <div id="cronometro" class="mensaje"></div>
  <div id="frase" class="mensaje"></div>
  <div id="logros"></div>
  <div class="progreso"><div class="barra" id="barraProgreso"></div></div>
  <button class="boton" id="continuarBtn" onclick="elegirContinuar()">🔁 Continuar al siguiente nivel</button>
  <button class="boton" id="nivelBtn" onclick="mostrarBotones()">🔙 Elegir otro nivel</button>

  <script>
    let tiempoRestante = 0, intervalo;
    let ritmoSecuencia = [], nivel, ritmoActual;
    let descansoMinutos = 0;
    let liberacionAnterior = false;
    let metronomoIntervalo;

    let frases = {
      lento: ["🌊 Respiración tranquila...", "🫧 Expande tu mente...", "🧘 Fluye con la calma..."],
      normal: ["🚶 Ritmo mental fluido...", "😌 Concéntrate y respira...", "🌟 Enfócate en tu eje interno..."],
      rapido: ["⚡ El pulso se acelera...", "🔥 Energía contenida, mente firme...", "💥 Siente el control total..."],
      extremo: ["🌀 Mente en fuego controlado...", "💀 Nada te domina. Solo respira.", "🧠 Mantén el deseo en silencio..."]
    };

    function mostrarFraseCopilot() {
      let mensajesCopilot = {
        lento: ["🤝 Estoy contigo, respira sin prisa.", "🌙 Te acompaño en cada inhalación."],
        normal: ["👣 Sigues avanzando con paso firme.", "🧘 Mantén ese foco, todo fluye."],
        rapido: ["🚀 Tu mente está volando. Yo vigilo desde la cabina.", "🔥 ¡Eso es! Estamos en el control."],
        extremo: ["🛡️ Nadie interrumpe tu enfoque. Soy tu copiloto silencioso.", "🧠 La tormenta no te toca. Yo estoy aquí."]
      };
      let lista = mensajesCopilot[ritmoActual] || mensajesCopilot["normal"];
      let frase = lista[Math.floor(Math.random() * lista.length)];
      document.getElementById("frase").textContent = frase;
    }

    function iniciar(n) {
      nivel = n;
      clearInterval(intervalo);
      clearInterval(metronomoIntervalo);
      document.getElementById("frase").textContent = "";
      document.getElementById("burbujaRespiracion").style.display = "none";
      document.getElementById("esfera").style.display = "block";
      document.getElementById("continuarBtn").style.display = "none";
      document.getElementById("nivelBtn").style.display = "none";
      document.getElementById("logros").textContent = "";

      tiempoRestante = nivel === 'facil' ? 75 * 60 :
                       nivel === 'medio' ? 135 * 60 :
                       nivel === 'dificil' ? 180 * 60 :
                       nivel === 'extremo' ? 195 * 60 :
                       nivel === 'mar_on_fire_1' ? 10 * 60 :
                       nivel === 'mar_on_fire_2' ? 10 * 60 :
                       nivel === 'mar_on_fire_3' ? 10 * 60 :
                       nivel === 'xtremo_1' ? 200 * 60 :
                       nivel === 'rapidin_1' ? 5 * 60 :
                       nivel === 'rapidin_2' ? 5 * 60 :
                       90 * 60;

      document.getElementById("estado").textContent = `🧘 Nivel seleccionado: ${nivel.toUpperCase()}`;
      actualizarCronometro();
      generarSecuencia();
      cambiarRitmo();
      actualizarProgreso();
      iniciarMetronomo();

      intervalo = setInterval(() => {
        tiempoRestante--;
        actualizarCronometro();
        actualizarProgreso();
        if (tiempoRestante % 25 === 0) cambiarRitmo();
        if (tiempoRestante % 300 === 0) {
          mostrarFrase();
          mostrarFraseCopilot();
        }
        if (tiempoRestante <= 0) finalizarSesion();
        if (tiempoRestante <= 60) acelerarRitmo();
        if (tiempoRestante <= 10) animacionFinal();
      }, 1000);
    }

    function iniciarMetronomo() {
      let velocidad = ritmoActual === "lento" ? 1500 :
                      ritmoActual === "normal" ? 1000 :
                      ritmoActual === "rapido" ? 500 :
                      250;
      metronomoIntervalo = setInterval(() => {
        console.log("Tic");
      }, velocidad);
    }

    function generarSecuencia() {
      let extras = nivel === 'facil' ? ["normal"] :
                   nivel === 'medio' ? ["normal", "rapido"] :
                   nivel === 'dificil' ? ["rapido", "rapido"] :
                   nivel === 'extremo' ? ["rapido", "extremo", "extremo"] :
                   nivel === 'mar_on_fire_1' ? ["extremo", "extremo", "extremo"] :
                   nivel === 'mar_on_fire_2' ? ["extremo", "extremo", "extremo", "extremo"] :
                   nivel === 'mar_on_fire_3' ? ["extremo", "extremo", "extremo", "extremo", "extremo"] :
                   nivel === 'xtremo_1' ? ["extremo", "extremo", "extremo", "extremo", "extremo", "extremo"] :
                   nivel === 'rapidin_1' ? ["extremo", "extremo", "extremo", "extremo"] :
                   nivel === 'rapidin_2' ? ["extremo", "extremo", "extremo", "extremo"] :
                   ["lento", "rapido", "normal", "extremo", "normal", "rapido", "lento"];
      ritmoSecuencia = ["lento", ...extras.sort(() => Math.random() - 0.5)];
    }

    function cambiarRitmo() {
      ritmoActual = ritmoSecuencia[Math.floor(Math.random() * ritmoSecuencia.length)];
      let animacion = ritmoActual === "lento" ? "latidoLento 2.5s" :
                      ritmoActual === "normal" ? "latidoNormal 2s" :
                      ritmoActual === "rapido" ? "latidoRapido 1s" :
                      "latidoExtremo 0.5s";
      document.getElementById("esfera").style.animation = `${animacion} infinite ease-in-out`;
      document.getElementById("estado").textContent = `🌌 Ritmo activo: ${ritmoActual.toUpperCase()}`;
      clearInterval(metronomoIntervalo);
      iniciarMetronomo();
    }

    function mostrarFrase() {
      let lista = frases[ritmoActual] || frases["normal"];
      let frase = lista[Math.floor(Math.random() * lista.length)];
      document.getElementById("frase").textContent = frase;
    }

    function actualizarCronometro() {
      let m = Math.floor(tiempoRestante / 60);
      let s = tiempoRestante % 60;
      document.getElementById("cronometro").textContent = `🕒 Tiempo restante: ${m}m ${s}s`;
    }

    function actualizarProgreso() {
      let progreso = ((nivel === 'facil' ? 75 * 60 :
                      nivel === 'medio' ? 135 * 60 :
                      nivel === 'dificil' ? 180 * 60 :
                      nivel === 'extremo' ? 195 * 60 :
                      nivel === 'mar_on_fire_1' ? 10 * 60 :
                      nivel === 'mar_on_fire_2' ? 10 * 60 :
                      nivel === 'mar_on_fire_3' ? 10 * 60 :
                      nivel === 'xtremo_1' ? 200 * 60 :
                      nivel === 'rapidin_1' ? 5 * 60 :
                      nivel === 'rapidin_2' ? 5 * 60 :
                      90 * 60) - tiempoRestante) / (nivel === 'facil' ? 75 * 60 :
                      nivel === 'medio' ? 135 * 60 :
                      nivel === 'dificil' ? 180 * 60 :
                      nivel === 'extremo' ? 195 * 60 :
                      nivel === 'mar_on_fire_1' ? 10 * 60 :
                      nivel === 'mar_on_fire_2' ? 10 * 60 :
                      nivel === 'mar_on_fire_3' ? 10 * 60 :
                      nivel === 'xtremo_1' ? 200 * 60 :
                      nivel === 'rapidin_1' ? 5 * 60 :
                      nivel === 'rapidin_2' ? 5 * 60 :
                      90 * 60) * 100;
      document.getElementById("barraProgreso").style.width = `${progreso}%`;
    }

    function acelerarRitmo() {
      let animacion = ritmoActual === "lento" ? "latidoLento 2s" :
                      ritmoActual === "normal" ? "latidoNormal 1.5s" :
                      ritmoActual === "rapido" ? "latidoRapido 0.8s" :
                      "latidoExtremo 0.4s";
      document.getElementById("esfera").style.animation = `${animacion} infinite ease-in-out`;
    }

    function animacionFinal() {
      document.getElementById("esfera").style.animation = "animacionFinal 0.4s infinite ease-in-out";
      document.getElementById("estado").textContent = "💪 ¡Últimos segundos! ¡No te rindas!";
    }

    function finalizarSesion() {
      clearInterval(intervalo);
      clearInterval(metronomoIntervalo);
      document.getElementById("esfera").style.display = "none";
      document.getElementById("burbujaRespiracion").style.display = "block";
      document.getElementById("estado").textContent = "🌟 Sesión completa. Entra en descanso...";
      document.getElementById("cronometro").textContent = "";
      document.getElementById("frase").textContent = "";

      descansoMinutos = nivel === 'facil' || nivel === 'medio' ? 15 : 45;
      mostrarLogro();
      iniciarDescanso();
    }

    function mostrarLogro() {
      let medalla = nivel === 'facil' ? "🥉" :
                    nivel === 'medio' ? "🥈" :
                    nivel === 'dificil' ? "🥇" :
                    nivel === 'extremo' ? "🏆" :
                    nivel === 'mar_on_fire_1' ? "🔥" :
                    nivel === 'mar_on_fire_2' ? "🔥🔥" :
                    nivel === 'mar_on_fire_3' ? "🔥🔥🔥" :
                    nivel === 'xtremo_1' ? "🚨" :
                    nivel === 'rapidin_1' ? "⚡" :
                    nivel === 'rapidin_2' ? "⚡⚡" : "⚡";
      document.getElementById("logros").textContent = `🎖️ Has ganado: ${medalla} — Nivel ${nivel.toUpperCase()} completado`;
    }

    function iniciarDescanso() {
      let descanso = descansoMinutos * 60;
      document.getElementById("estado").textContent = `🌌 Descanso activo: ${descansoMinutos} minutos`;
      document.getElementById("burbujaRespiracion").style.animation = "respiracion 5s infinite ease-in-out";
      intervalo = setInterval(() => {
        descanso--;
        if (descanso <= 0) {
          clearInterval(intervalo);
          document.getElementById("estado").textContent = "🌟 Descanso completo. ¡Listo para continuar!";
          document.getElementById("continuarBtn").style.display = "block";
          document.getElementById("nivelBtn").style.display = "block";
        }
      }, 1000);
    }

    function elegirContinuar() {
      iniciar(nivel);
    }

    function mostrarBotones() {
      document.getElementById("continuarBtn").style.display = "none";
      document.getElementById("nivelBtn").style.display = "none";
      document.getElementById("estado").textContent = "";
      document.getElementById("logros").textContent = "";
      document.getElementById("frase").textContent = "";
      document.getElementById("cronometro").textContent = "";
      document.getElementById("esfera").style.display = "block";
      document.getElementById("burbujaRespiracion").style.display = "none";
    }

    function activarMarOnFire3() {
      if (!liberacionAnterior) {
        iniciar('mar_on_fire_3');
      } else {
        document.getElementById("estado").textContent = "🌟 Modo secreto no disponible. Completa los niveles anteriores.";
      }
    }
  </script>
</body>
</html></details>
