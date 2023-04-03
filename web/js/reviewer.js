/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



const replyLinks = document.querySelectorAll('.reply-link');

replyLinks.forEach(link => {
    link.addEventListener('click', (event) => {
        event.preventDefault();
        const replyForm = document.getElementById(link.id + '-comment');
        replyForm.classList.toggle('d-none');
    });
});















