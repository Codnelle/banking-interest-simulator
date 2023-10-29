import { banking } from "../../declarations/banking";


window.addEventListener("load", async function() {
   update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  // console.log("Submitted");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true)

if (document.getElementById("input-amount").value.length != 0) {
  await banking.topUp(inputAmount);
}

if (document.getElementById("withdrawal-amount").value.length != 0){
  await banking.withdraw(outputAmount);
} 
 await banking.compound();

  let currentAmount = await banking.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled");
});

async function update() {
  const currentAmount = await banking.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
}