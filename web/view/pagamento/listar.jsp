<%@page import="dao.PagamentoDAO"%>
<%@page import="model.Pagamento"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Pagamentos</title>
        <link href="../../dist/css/output.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
            PagamentoDAO pagamentoDAO = new PagamentoDAO();
            List<Pagamento> lista = new ArrayList();
            lista = pagamentoDAO.consultar_lista(); 
        %>
        <main>
            <div class="flex justify-between mb-4">
                <h2 class="text-3xl text-gray-900 font-semibold">Pagamentos</h2>
                <a
                  href="#"
                 class="flex items-center gap-2 px-3 py-3 text-sm text-white bg-orange-500 rounded-lg hover:bg-amber-400 transition-all duration-200 ease-in"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                  >
                    <mask
                      id="mask0_4_1055"
                      style="mask-type: alpha"
                      maskUnits="userSpaceOnUse"
                      x="0"
                      y="0"
                      width="24"
                      height="24"
                    >
                      <rect width="24" height="24" fill="#D9D9D9" />
                    </mask>
                    <g mask="url(#mask0_4_1055)">
                      <path
                        d="M11 13H5V11H11V5H13V11H19V13H13V19H11V13Z"
                        fill="white"
                      />
                    </g>
                  </svg>
                  Adicionar novo Pagamento
                </a>
             </div>
            <div class="bg-white p-6 shadow-xl rounded-lg">
                <table class="w-full text-sm text-left text-gray-700">
                  <thead class="text-gray-400">
                    <tr>
                      <th class="px-4 py-3 font-normal">ID</th>
                      <th class="px-4 py-3 font-normal">Nome</th>
                      <th class="px-4 py-3 font-normal">Email</th>
                      <th class="px-4 py-3 font-normal">Endereço</th>
                      <th class="px-4 py-3 font-normal">CNPJ</th>
                      <th class="px-4 py-3 font-normal">Ações</th>
                    </tr>
                  </thead>
                  <tbody class="bg-white">
                     
                    <% for(int i = 0; i<= lista.size()-1; i++ ){ %> 
                    <tr class="border-b border-gray-100">
                      <td class="px-4 py-3 text-gray-500"><%= lista.get(i).getId() %></td>
                      <td class="px-4 py-3 font-semibold text-gray-900"><%= lista.get(i).getNome() %></td>
                      <td class="px-4 py-3 text-gray-400"><%= lista.get(i).getEmail() %></td>
                      <td class="px-4 py-3 text-gray-400"><%= lista.get(i).getEndereco() %></td>
                      <td class="px-4 py-3 text-gray-400"><%= lista.get(i).getCnpj() %></td>
                      <td class="relative px-4 py-3">
                        <button
                          class="btn-drop bg-gray-100 px-3 py-4 w-fit rounded-lg font-bold hover:bg-gray-200 transiton-all duration-300 ease-in-out cursor-pointer"
                        >
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            width="16"
                            height="4"
                            viewBox="0 0 16 4"
                            fill="none"
                          >
                            <path
                              d="M2 4C1.45 4 0.979167 3.80417 0.5875 3.4125C0.195833 3.02083 0 2.55 0 2C0 1.45 0.195833 0.979167 0.5875 0.5875C0.979167 0.195833 1.45 0 2 0C2.55 0 3.02083 0.195833 3.4125 0.5875C3.80417 0.979167 4 1.45 4 2C4 2.55 3.80417 3.02083 3.4125 3.4125C3.02083 3.80417 2.55 4 2 4ZM8 4C7.45 4 6.97917 3.80417 6.5875 3.4125C6.19583 3.02083 6 2.55 6 2C6 1.45 6.19583 0.979167 6.5875 0.5875C6.97917 0.195833 7.45 0 8 0C8.55 0 9.02083 0.195833 9.4125 0.5875C9.80417 0.979167 10 1.45 10 2C10 2.55 9.80417 3.02083 9.4125 3.4125C9.02083 3.80417 8.55 4 8 4ZM14 4C13.45 4 12.9792 3.80417 12.5875 3.4125C12.1958 3.02083 12 2.55 12 2C12 1.45 12.1958 0.979167 12.5875 0.5875C12.9792 0.195833 13.45 0 14 0C14.55 0 15.0208 0.195833 15.4125 0.5875C15.8042 0.979167 16 1.45 16 2C16 2.55 15.8042 3.02083 15.4125 3.4125C15.0208 3.80417 14.55 4 14 4Z"
                              fill="#1C1B1F"
                            />
                          </svg>
                        </button>
                        <div
                          class="drop absolute left-0 top-full flex-col p-4 bg-white rounded-lg shadow-sm z-10 hidden"
                        >
                          <a
                            href="#"
                            class="group flex items-center gap-2 p-2 text-gray-400 hover:bg-orange-100 hover:text-orange-400 rounded-sm transition-all duration-300 ease-in-out"
                          >
                            <svg
                              xmlns="http://www.w3.org/2000/svg"
                              class="size-4 fill-current group-hover:fill-orange-400"
                              viewBox="0 0 24 24"
                            >
                              <mask
                                id="mask0_9_19"
                                style="mask-type: alpha"
                                maskUnits="userSpaceOnUse"
                                x="0"
                                y="0"
                              >
                                <rect width="24" height="24" />
                              </mask>
                              <g mask="url(#mask0_9_19)">
                                <path
                                  d="M5 21C4.45 21 3.97917 20.8041 3.5875 20.4125C3.19583 20.0208 3 19.55 3 19V4.99998C3 4.44998 3.19583 3.97914 3.5875 3.58748C3.97917 3.19581 4.45 2.99998 5 2.99998H11.525C11.8583 2.99998 12.1083 3.10414 12.275 3.31248C12.4417 3.52081 12.525 3.74998 12.525 3.99998C12.525 4.24998 12.4375 4.47914 12.2625 4.68748C12.0875 4.89581 11.8333 4.99998 11.5 4.99998H5V19H19V12.475C19 12.1416 19.1042 11.8916 19.3125 11.725C19.5208 11.5583 19.75 11.475 20 11.475C20.25 11.475 20.4792 11.5583 20.6875 11.725C20.8958 11.8916 21 12.1416 21 12.475V19C21 19.55 20.8042 20.0208 20.4125 20.4125C20.0208 20.8041 19.55 21 19 21H5ZM9 14V11.575C9 11.3083 9.05 11.0541 9.15 10.8125C9.25 10.5708 9.39167 10.3583 9.575 10.175L18.175 1.57498C18.375 1.37498 18.6 1.22498 18.85 1.12498C19.1 1.02498 19.35 0.974976 19.6 0.974976C19.8667 0.974976 20.1208 1.02498 20.3625 1.12498C20.6042 1.22498 20.825 1.37498 21.025 1.57498L22.425 2.99998C22.6083 3.19998 22.75 3.42081 22.85 3.66248C22.95 3.90414 23 4.14998 23 4.39998C23 4.64998 22.9542 4.89581 22.8625 5.13748C22.7708 5.37914 22.625 5.59998 22.425 5.79998L13.825 14.4C13.6417 14.5833 13.4292 14.7291 13.1875 14.8375C12.9458 14.9458 12.6917 15 12.425 15H10C9.71667 15 9.47917 14.9041 9.2875 14.7125C9.09583 14.5208 9 14.2833 9 14ZM11 13H12.4L18.2 7.19998L17.5 6.49998L16.775 5.79998L11 11.575V13Z"
                                />
                              </g>
                            </svg>
                            Editar
                          </a>
                          <a
                            href="#"
                            class="p-2 hover:bg-orange-100 rounded-sm transition-all duration-300 ease-in-out"
                          >
                            Excluir
                          </a>
                        </div>
                      </td>
                    </tr>
                    <% } %>
                  </tbody>
                </table>
            </div>
        </main>
        <script src="../../dist/js/script.js" type="text/javascript"></script>
    </body>
</html>
