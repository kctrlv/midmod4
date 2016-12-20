var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $newLinkTitle = $("#link_title");
  $newLinkUrl  = $("#link_url");
  $userId = $("#links-list").data("user")

  $("#submit_link").on('click', createLink);
})

function createLink (event){
  event.preventDefault();

  console.log("win")
  console.log($userId)

  var link = getLinkData();

  $.post("/api/v1/links", link)
   .then( renderLink )
   .fail( displayFailure )
 }

function getLinkData() {
 return {
   user_id: $userId
   title: $newLinkTitle.val(),
   url: $newLinkUrl.val(),
 }
}

function renderLink(link){
  console.log("rendering link")
  $("#links-list").find('table').prepend( linkHTML(link) )
  // clearLink();
}

function linkHTML(link) {

    // return `<div class='link' data-id='${link.id}' id="link-${link.id}">
    //           <p class='link-title' contenteditable=true>${ link.title }</p>
    //           <p class='link-url' contenteditable=true>${ link.url }</p>
    //
    //           <p class="link_read">
    //             ${ link.read }
    //           </p>
    //           <p class="link_buttons">
    //             <button class="upgrade-quality">+</button>
    //             <button class="downgrade-quality">-</button>
    //             <button class='delete-link'>Delete</button>
    //           </p>
    //         </div>`

    return `<tr class='link' data-id='${link.id}' id="link-${link.id}">
              <td class='link-title'><a href=${link.url}>${link.title}</td>
            </tr>`
}

function clearLink() {
  $newLinkTitle.val("");
  $newLinkUrl.val("");
}

function displayFailure(failureData){
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
}
