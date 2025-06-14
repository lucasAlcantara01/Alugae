<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Alugaê</title>
    <link href="./dist/css/output.css" rel="stylesheet" type="text/css" />
  </head>

  <% String usuario = (String) session.getAttribute("usuario"); if(usuario ==
  null){ response.sendRedirect("login.jsp"); } else { %>
  <body class="flex h-screen">
    <aside class="flex flex-col px-8 pt-13 w-1/5 h-full">
      <a href="./index.html" class="mb-9">
        <img src="./assets/alugae.svg" class="h-6" alt="Logotipo" />
      </a>
      <div class="flex flex-col justify-between h-full">
        <div>
          <a
            href="./view/cliente/listar.jsp"
            target="main-content"
            class="group flex gap-2 py-4 px-3 text-gray-500 hover:bg-orange-100 hover:text-orange-500 transition-all duration-200 ease-in-out rounded-lg"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
              viewBox="0 0 24 24"
            >
              <mask
                id="mask0_2_8002"
                style="mask-type: alpha"
                maskUnits="userSpaceOnUse"
                x="0"
                y="0"
                width="24"
                height="24"
              >
                <rect width="24" height="24" fill="#D9D9D9" />
              </mask>
              <g mask="url(#mask0_2_8002)">
                <path
                  d="M1 20V17.2C1 16.6333 1.14583 16.1125 1.4375 15.6375C1.72917 15.1625 2.11667 14.8 2.6 14.55C3.63333 14.0333 4.68333 13.6458 5.75 13.3875C6.81667 13.1292 7.9 13 9 13C10.1 13 11.1833 13.1292 12.25 13.3875C13.3167 13.6458 14.3667 14.0333 15.4 14.55C15.8833 14.8 16.2708 15.1625 16.5625 15.6375C16.8542 16.1125 17 16.6333 17 17.2V20H1ZM19 20V17C19 16.2667 18.7958 15.5625 18.3875 14.8875C17.9792 14.2125 17.4 13.6333 16.65 13.15C17.5 13.25 18.3 13.4208 19.05 13.6625C19.8 13.9042 20.5 14.2 21.15 14.55C21.75 14.8833 22.2083 15.2542 22.525 15.6625C22.8417 16.0708 23 16.5167 23 17V20H19ZM9 12C7.9 12 6.95833 11.6083 6.175 10.825C5.39167 10.0417 5 9.1 5 8C5 6.9 5.39167 5.95833 6.175 5.175C6.95833 4.39167 7.9 4 9 4C10.1 4 11.0417 4.39167 11.825 5.175C12.6083 5.95833 13 6.9 13 8C13 9.1 12.6083 10.0417 11.825 10.825C11.0417 11.6083 10.1 12 9 12ZM19 8C19 9.1 18.6083 10.0417 17.825 10.825C17.0417 11.6083 16.1 12 15 12C14.8167 12 14.5833 11.9792 14.3 11.9375C14.0167 11.8958 13.7833 11.85 13.6 11.8C14.05 11.2667 14.3958 10.675 14.6375 10.025C14.8792 9.375 15 8.7 15 8C15 7.3 14.8792 6.625 14.6375 5.975C14.3958 5.325 14.05 4.73333 13.6 4.2C13.8333 4.11667 14.0667 4.0625 14.3 4.0375C14.5333 4.0125 14.7667 4 15 4C16.1 4 17.0417 4.39167 17.825 5.175C18.6083 5.95833 19 6.9 19 8ZM3 18H15V17.2C15 17.0167 14.9542 16.85 14.8625 16.7C14.7708 16.55 14.65 16.4333 14.5 16.35C13.6 15.9 12.6917 15.5625 11.775 15.3375C10.8583 15.1125 9.93333 15 9 15C8.06667 15 7.14167 15.1125 6.225 15.3375C5.30833 15.5625 4.4 15.9 3.5 16.35C3.35 16.4333 3.22917 16.55 3.1375 16.7C3.04583 16.85 3 17.0167 3 17.2V18ZM9 10C9.55 10 10.0208 9.80417 10.4125 9.4125C10.8042 9.02083 11 8.55 11 8C11 7.45 10.8042 6.97917 10.4125 6.5875C10.0208 6.19583 9.55 6 9 6C8.45 6 7.97917 6.19583 7.5875 6.5875C7.19583 6.97917 7 7.45 7 8C7 8.55 7.19583 9.02083 7.5875 9.4125C7.97917 9.80417 8.45 10 9 10Z"
                />
              </g>
            </svg>
            Clientes
          </a>
          <a
            href="view/carro/listar.jsp"
            target="main-content"
            class="group flex gap-2 py-4 px-3 text-gray-500 hover:bg-orange-100 hover:text-orange-500 transition-all duration-200 ease-in-out rounded-lg"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
              viewBox="0 0 24 24"
            >
              <mask
                id="mask0_12_19"
                style="mask-type: alpha"
                maskUnits="userSpaceOnUse"
                x="0"
                y="0"
                width="24"
                height="24"
              >
                <rect width="24" height="24" fill="#D9D9D9" />
              </mask>
              <g mask="url(#mask0_12_19)">
                <path
                  d="M2 22C1.71667 22 1.47917 21.9042 1.2875 21.7125C1.09583 21.5208 1 21.2833 1 21V13L3.125 7.925C3.24167 7.64167 3.425 7.41667 3.675 7.25C3.925 7.08333 4.2 7 4.5 7H13.5C13.8 7 14.075 7.08333 14.325 7.25C14.575 7.41667 14.7583 7.64167 14.875 7.925L17 13V21C17 21.2833 16.9042 21.5208 16.7125 21.7125C16.5208 21.9042 16.2833 22 16 22H15C14.7167 22 14.4792 21.9042 14.2875 21.7125C14.0958 21.5208 14 21.2833 14 21V20H4V21C4 21.2833 3.90417 21.5208 3.7125 21.7125C3.52083 21.9042 3.28333 22 3 22H2ZM3.8 11H14.175L13.35 9H4.65L3.8 11ZM3 18H15V13H3V18ZM5.5 17C5.91667 17 6.27083 16.8542 6.5625 16.5625C6.85417 16.2708 7 15.9167 7 15.5C7 15.0833 6.85417 14.7292 6.5625 14.4375C6.27083 14.1458 5.91667 14 5.5 14C5.08333 14 4.72917 14.1458 4.4375 14.4375C4.14583 14.7292 4 15.0833 4 15.5C4 15.9167 4.14583 16.2708 4.4375 16.5625C4.72917 16.8542 5.08333 17 5.5 17ZM12.5 17C12.9167 17 13.2708 16.8542 13.5625 16.5625C13.8542 16.2708 14 15.9167 14 15.5C14 15.0833 13.8542 14.7292 13.5625 14.4375C13.2708 14.1458 12.9167 14 12.5 14C12.0833 14 11.7292 14.1458 11.4375 14.4375C11.1458 14.7292 11 15.0833 11 15.5C11 15.9167 11.1458 16.2708 11.4375 16.5625C11.7292 16.8542 12.0833 17 12.5 17ZM18 19V10.4L16.175 6H5.675L6.125 4.925C6.24167 4.64167 6.425 4.41667 6.675 4.25C6.925 4.08333 7.2 4 7.5 4H16.5C16.8 4 17.075 4.08333 17.325 4.25C17.575 4.41667 17.7583 4.64167 17.875 4.925L20 10V18C20 18.2833 19.9042 18.5208 19.7125 18.7125C19.5208 18.9042 19.2833 19 19 19H18ZM21 16V7.4L19.175 3H8.675L9.125 1.925C9.24167 1.64167 9.425 1.41667 9.675 1.25C9.925 1.08333 10.2 1 10.5 1H19.5C19.8 1 20.075 1.08333 20.325 1.25C20.575 1.41667 20.7583 1.64167 20.875 1.925L23 7V15C23 15.2833 22.9042 15.5208 22.7125 15.7125C22.5208 15.9042 22.2833 16 22 16H21Z"
                />
              </g>
            </svg>
            Carros
          </a>
          <a
            href="view/locacao/listar.jsp"
            target="main-content"
            class="group flex gap-2 py-4 px-3 text-gray-500 hover:bg-orange-100 hover:text-orange-500 transition-all duration-200 ease-in-out rounded-lg"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
              viewBox="0 0 24 24"
            >
              <mask
                id="mask0_12_25"
                style="mask-type: alpha"
                maskUnits="userSpaceOnUse"
                x="0"
                y="0"
                width="24"
                height="24"
              >
                <rect width="24" height="24" />
              </mask>
              <g mask="url(#mask0_12_25)">
                <path
                  d="M6 22C5.16667 22 4.45833 21.7083 3.875 21.125C3.29167 20.5417 3 19.8333 3 19V16H6V2H21V19C21 19.8333 20.7083 20.5417 20.125 21.125C19.5417 21.7083 18.8333 22 18 22H6ZM18 20C18.2833 20 18.5208 19.9042 18.7125 19.7125C18.9042 19.5208 19 19.2833 19 19V4H8V16H17V19C17 19.2833 17.0958 19.5208 17.2875 19.7125C17.4792 19.9042 17.7167 20 18 20ZM9 9V7H18V9H9ZM9 12V10H18V12H9ZM6 20H15V18H5V19C5 19.2833 5.09583 19.5208 5.2875 19.7125C5.47917 19.9042 5.71667 20 6 20ZM6 20H5H15H6Z"
                />
              </g>
            </svg>
            Locação
          </a>
          <a
            href="view/pagamento/listar.jsp"
            target="main-content"
            class="group flex gap-2 py-4 px-3 text-gray-500 hover:bg-orange-100 hover:text-orange-500 transition-all duration-200 ease-in-out rounded-lg"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
              viewBox="0 0 24 24"
            >
              <mask
                id="mask0_12_7"
                style="mask-type: alpha"
                maskUnits="userSpaceOnUse"
                x="0"
                y="0"
                width="24"
                height="24"
              >
                <rect width="24" height="24" />
              </mask>
              <g mask="url(#mask0_12_7)">
                <path
                  d="M5 21C4.45 21 3.97917 20.8042 3.5875 20.4125C3.19583 20.0208 3 19.55 3 19V5C3 4.45 3.19583 3.97917 3.5875 3.5875C3.97917 3.19583 4.45 3 5 3H19C19.55 3 20.0208 3.19583 20.4125 3.5875C20.8042 3.97917 21 4.45 21 5V7.5H19V5H5V19H19V16.5H21V19C21 19.55 20.8042 20.0208 20.4125 20.4125C20.0208 20.8042 19.55 21 19 21H5ZM13 17C12.45 17 11.9792 16.8042 11.5875 16.4125C11.1958 16.0208 11 15.55 11 15V9C11 8.45 11.1958 7.97917 11.5875 7.5875C11.9792 7.19583 12.45 7 13 7H20C20.55 7 21.0208 7.19583 21.4125 7.5875C21.8042 7.97917 22 8.45 22 9V15C22 15.55 21.8042 16.0208 21.4125 16.4125C21.0208 16.8042 20.55 17 20 17H13ZM20 15V9H13V15H20ZM16 13.5C16.4167 13.5 16.7708 13.3542 17.0625 13.0625C17.3542 12.7708 17.5 12.4167 17.5 12C17.5 11.5833 17.3542 11.2292 17.0625 10.9375C16.7708 10.6458 16.4167 10.5 16 10.5C15.5833 10.5 15.2292 10.6458 14.9375 10.9375C14.6458 11.2292 14.5 11.5833 14.5 12C14.5 12.4167 14.6458 12.7708 14.9375 13.0625C15.2292 13.3542 15.5833 13.5 16 13.5Z"
                />
              </g>
            </svg>
            Pagamentos
          </a>
          <a
            href="view/empresa/listar.jsp"
            target="main-content"
            class="group flex gap-2 py-4 px-3 text-gray-500 hover:bg-orange-100 hover:text-orange-500 transition-all duration-200 ease-in-out rounded-lg"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
              viewBox="0 0 24 24"
            >
              <mask
                id="mask0_12_13"
                style="mask-type: alpha"
                maskUnits="userSpaceOnUse"
                x="0"
                y="0"
                width="24"
                height="24"
              >
                <rect width="24" height="24" />
              </mask>
              <g mask="url(#mask0_12_13)">
                <path
                  d="M3 21V7H7V3H17V11H21V21H13V17H11V21H3ZM5 19H7V17H5V19ZM5 15H7V13H5V15ZM5 11H7V9H5V11ZM9 15H11V13H9V15ZM9 11H11V9H9V11ZM9 7H11V5H9V7ZM13 15H15V13H13V15ZM13 11H15V9H13V11ZM13 7H15V5H13V7ZM17 19H19V17H17V19ZM17 15H19V13H17V15Z"
                />
              </g>
            </svg>
            Empresas
          </a>
        </div>
        <a
          href="deslogar.jsp"
          class="group flex gap-2 py-4 px-3 text-gray-400 hover:text-orange-500 transition-all duration-200 ease-in-out"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            class="size-6 fill-current group-hover:fill-amber-600 transition-all duration-200 ease-in-out"
            viewBox="0 0 25 25"
          >
            <mask
              id="mask0_4669_161"
              style="mask-type: alpha"
              maskUnits="userSpaceOnUse"
              x="0"
              y="0"
              width="25"
              height="25"
            >
              <rect x="0.780518" y="0.320801" width="24" height="24" />
            </mask>
            <g mask="url(#mask0_4669_161)">
              <path
                d="M5.78052 21.3208C5.23052 21.3208 4.75968 21.125 4.36802 20.7333C3.97635 20.3416 3.78052 19.8708 3.78052 19.3208V15.3208H5.78052V19.3208H19.7805V5.3208H5.78052V9.3208H3.78052V5.3208C3.78052 4.7708 3.97635 4.29997 4.36802 3.9083C4.75968 3.51663 5.23052 3.3208 5.78052 3.3208H19.7805C20.3305 3.3208 20.8014 3.51663 21.193 3.9083C21.5847 4.29997 21.7805 4.7708 21.7805 5.3208V19.3208C21.7805 19.8708 21.5847 20.3416 21.193 20.7333C20.8014 21.125 20.3305 21.3208 19.7805 21.3208H5.78052ZM11.2805 17.3208L9.88052 15.8708L12.4305 13.3208H3.78052V11.3208H12.4305L9.88052 8.7708L11.2805 7.3208L16.2805 12.3208L11.2805 17.3208Z"
              />
            </g>
          </svg>
          logout
        </a>
      </div>
    </aside>
    <main class="bg-gray-100 w-full p-8">
      <iframe name="main-content" width="100%" height="100%"> </iframe>
    </main>
    <script src="./dist/js/script.js"></script>
  </body>
  <% } %>
</html>
