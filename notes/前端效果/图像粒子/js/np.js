const IMAGE_URL = "img/血小板.jpeg";
const PARTICLE_SIZE = 3; // image pixel size
const PADDING = 70;
const DEFAULT_REPULSION_CHANGE_DISTANCE = 80;

let repulsionChangeDistance = DEFAULT_REPULSION_CHANGE_DISTANCE;
let pointSystem = null;
let targetImage = null;

// ==================================================
// ImageParticle Class
// ==================================================
class ImageParticle {
  constructor(originPosition, originScale, originColor) {
    this.position = originPosition.copy();
    this.originPosition = originPosition.copy();
    this.velocity = createVector(random(0, 50), random(0, 50));
    this.repulsion = random(1.0, 5.0);
		this.mouseRepulsion = 1.0;
    this.gravity = 0.01;
		this.maxGravity = random(0.01, 0.04);
    this.scale = originScale;
    this.originScale = originScale;
    this.color = originColor;
    this.sprite = null;
  }
  
  createSprite(texture) {
    this.sprite = new PIXI.Sprite(texture);
    this.sprite.tint = (this.color[0] << 16) + (this.color[1] << 8) + (this.color[2]);
    
    return this.sprite;
  }
  
  updateState() {
    this._updateStateByMouse();
    this._updateStateByOrigin();
    this.velocity.mult(0.95);
    this.position.add(this.velocity);
    
    this.sprite.position.x = this.position.x;
    this.sprite.position.y = this.position.y;
    this.sprite.scale.x = this.sprite.scale.y = this.scale;
  }
  
  _updateStateByMouse() {
    const distanceX = mouseX - this.position.x;
    const distanceY = mouseY - this.position.y;
    const distance = mag(distanceX, distanceY);
    const pointCos = distanceX / distance;
    const pointSin = distanceY / distance;
    
    if (distance < repulsionChangeDistance) {
      this.gravity *= 0.6;
      this.mouseRepulsion = max(0, this.mouseRepulsion * 0.5 - 0.01);
      this.velocity.sub(pointCos * this.repulsion, pointSin * this.repulsion);
      this.velocity.mult(1 - this.mouseRepulsion);
    } else {
      this.gravity += (this.maxGravity - this.gravity) * 0.1;
      this.mouseRepulsion = min(1, this.mouseRepulsion + 0.03);
    }
  }
  
  _updateStateByOrigin() {
    const distanceX = this.originPosition.x - this.position.x;
    const distanceY = this.originPosition.y - this.position.y;
    const distance = mag(distanceX, distanceY);
    
    this.velocity.add(distanceX * this.gravity, distanceY * this.gravity);
    this.scale = this.originScale + this.originScale * distance / 512;
  }
}

// ==================================================
// ImageParticleSystem 类别
// ==================================================
class ImageParticleSystem {
  constructor() {
    this.points = [];
    this.pointSprites = [];
    this.renderer = PIXI.autoDetectRenderer(window.innerWidth, window.innerHeight, {
      view: document.getElementById("viewport"),
      backgroundColor: 0xFFFFFF
    });
    this.stage = new PIXI.Container();
    this.container = new PIXI.Container();
    
    this._createParticles();
    this._setup();
  }
  
  _setup() {
    this.stage.addChild(this.container);
    document.body.appendChild(this.renderer.view);
  }
  
  _getPixel(x, y) {
    const pixels = targetImage.pixels;
    const idx = (y * targetImage.width + x) * 4;
    
    if (x > targetImage.width || x < 0 || y > targetImage.height || y < 0) {
      return [0,0,0,0];
    }
    
    return [
    	pixels[idx + 0],
    	pixels[idx + 1],
    	pixels[idx + 2],
    	pixels[idx + 3]
    ];
  }
  
  _createParticleTexture() {
    const graphics = new PIXI.Graphics();
    
    graphics.lineStyle(0);
    graphics.beginFill(0xFFFFFF);
    graphics.drawRect(0, 0, PARTICLE_SIZE, PARTICLE_SIZE);
    
    return graphics.generateTexture();
  }
  
  _createParticles() {
    const imageWidth = targetImage.width;
    const imageHeight = targetImage.height;
    const imageScale = min((window.innerWidth - PADDING * 2) / imageWidth, (window.innerHeight - PADDING * 2) / imageHeight);
    const texture = this._createParticleTexture();
    const fractionSizeX = imageWidth / PARTICLE_SIZE;
    const fractionSizeY = imageHeight / PARTICLE_SIZE;
    
    for (let i = 0; i < fractionSizeX; i++) {
      for (let j = 0; j < fractionSizeY; j++) {
        const imagePosition = createVector(int(i * PARTICLE_SIZE), int(j * PARTICLE_SIZE));
        let originPosition = imagePosition;
        let originScale = imageScale;
        let originColor = this._getPixel(imagePosition.x, imagePosition.y);
        
        if (originColor[3] === 0) {
          continue;
        }
        
        originPosition.mult(imageScale);
        originPosition.add(PADDING, PADDING);
        
        let point = new ImageParticle(originPosition, originScale, originColor);
        this.points.push(point);
        this.container.addChild(point.createSprite(texture));
      }
    }
    
    // console.log("particle count: %s", int(fractionSizeX * fractionSizeY));
  }

  updateState() {
    const mousePosition = this.renderer.plugins.interaction.mouse.global;
    mouseX = mousePosition.x;
    mouseY = mousePosition.y;
    
    for (let point of this.points) {
      point.updateState();
    }
  }
  
  render() {
    this.renderer.render(this.stage);
  }
}

// ==================================================
// Main
// ==================================================
function preload() {
  targetImage = loadImage(IMAGE_URL);
}

function setup() {
	targetImage.loadPixels();
  noStroke();
  frameRate(60);
  pointSystem = new ImageParticleSystem();
}

function draw() {
  repulsionChangeDistance = max(0, repulsionChangeDistance - 1.5);
  
  pointSystem.updateState();
  pointSystem.render();
}

function mouseMoved() {
  repulsionChangeDistance = DEFAULT_REPULSION_CHANGE_DISTANCE;
}
