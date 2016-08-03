/*
 * thing what gets portal info from a metro area
 *
 */


// grab all GUIDs from current view
//portalkeys=[];$.map(portals,function(k,v){portalkeys.push(v)});

// first req then get:
//portalDetail.request(key);
//portalDetail.get(key);

addToDownText = function( dict ){
  downtext.push([
    ['image',dict['image']], 
    ['latlng',[dict['latE6'],dict['lngE6']]],
    ['title',dict['title']]
  ])
}

hr = function(guid, data, success) {

  if (!data || data.error || !data.result) {
    success = false;
  }

  if (success) {

    var dict = decodeArray.portalDetail(data.result);

   addToDownText(dict);
  } else {
    if (data && data.error == "RETRY") {
      // server asked us to try again
      getportdat(guid);
    } else {
      window.runHooks ('portalDetailLoaded', {guid:guid, success:success});
    }
  }

}

getportdat = function(guid) {
  window.postAjax('getPortalDetails', {guid:guid},
      function(data,textStatus,jqXHR) { hr(guid, data, true); },
      function() { hr(guid, undefined, false); }
    );
}

// zoom for All Portals: 15
/*
 * map moving: map.setCenter(
 *   { lat: lat, lng: lng },
 *   zoomLevel )
 */

/* html for dl:

<textarea id="textbox">Type something here</textarea> <button id="create">Create file</button> <a download="info.txt" id="downloadlink" style="display: none">Download</a>
*/


// oneliner to retrieve all data in view: $.map(portals,function(k,v){getportdat(v)})
