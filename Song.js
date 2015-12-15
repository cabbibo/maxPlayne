function Song( controls , id , title , file , geo , mat ){
  
  this.body = new THREE.Mesh( geo , mat );
  this.position = this.body.position;

  controls.add( this.body );

  this.body.hoverOver = this.hoverOver.bind( this );
  this.body.hoverOut  = this.hoverOut.bind( this );
  this.body.select    = this.select.bind( this );

  this.hovered = 0;

  this.audio = audio;

  this.file = file;
  this.title = title;


}


Song.prototype.update = function(){
  

}

Song.prototype.hoverOver = function(){

  this.hovered = 1;

  hoveredLink = this;


}

Song.prototype.hoverOut = function(){

  this.hovered = 0;

  hoveredLink = undefined;
  
  
}


Song.prototype.select = function(){

  if( activeLink !== this ){
    var file = "audio/" + this.file + ".mp3";

    switchStream( file );

    activeLink = this;

  }

  
}