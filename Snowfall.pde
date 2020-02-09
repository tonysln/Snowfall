
ArrayList<Snowflake> snow = new ArrayList<Snowflake>();
PVector gravity;
float zOffset;
float brightness;
float a, b, c;
float windMultiplier;

final int NUM_OF_FLAKES = 400;

void setup() {
    zOffset = 0;
    brightness = 30.0;
    windMultiplier = 0.03;
    
    size(980,690);
    gravity = new PVector(0.0, 0.05);
    for (int i = 0; i < NUM_OF_FLAKES; i++) {
        int x = int(random(width));
        int y = int(random(height));
        snow.add(new Snowflake(x, y));
    }
}

void draw() {
    a = map(brightness, 0, 100, 25, 110);
    b = map(brightness, 0, 100, 25, 110);
    c = map(brightness, 0, 100, 35, 200);
    background(a, b, c);
    zOffset += 0.01;
    
    for (Snowflake flake : snow) {
    
        float xOffset = flake.pos.x / width;
        float yOffset = flake.pos.y / height;
        float windAngle = noise(xOffset, yOffset, zOffset) * TWO_PI;
        PVector wind = PVector.fromAngle(windAngle);
        wind.mult(windMultiplier);
        
        flake.applyForce(gravity);
        flake.applyForce(wind);
        flake.update();
        flake.render();
        
        // implement controls
    }
}
