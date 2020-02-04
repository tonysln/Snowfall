public class Snowflake {
    
    PVector pos;
    PVector vel;
    PVector acc;
    float r;
    float velocityFactor = 0.25;
    
    public Snowflake(int x, int y) {
        this.pos = new PVector(x, y);
        this.vel = new PVector();
        this.acc = new PVector();
        this.r = getRandomSize();
    }
    
    // resolve this mess
    public Snowflake() {
        this.pos = new PVector(int(random(width)), int(random(-100,-10)));
        this.vel = new PVector();
        this.acc = new PVector();
        this.r = getRandomSize();
    }
    
    private float getRandomSize() {
        float r = pow(random(0, 1), 3);
        return constrain(r * 20, 2, 20);
    }
    
    void applyForce(PVector force) {
        PVector f = force.copy();
        f.mult(this.r * 1.2);
        this.acc.add(f);
    }
    
    void randomize() {
        this.pos = new PVector(int(random(width)), int(random(-100, -10)));
        this.vel = new PVector();
        this.acc = new PVector();
        this.r = getRandomSize();
    }
    
    void update() {
        this.vel.add(this.acc);
        this.vel.limit(this.r * this.velocityFactor);
        
        if (this.vel.mag() < 1) {
            this.vel.normalize();
        }
        
        this.pos.add(this.vel);
        this.acc.mult(0);
        
        if (this.pos.y > height + this.r) {
            this.randomize();
        }
        if (this.pos.x < -this.r) {
            this.pos.x = width + this.r;
        }
        if (this.pos.x > width + this.r) {
            this.pos.x = -this.r;
        }
    }
    
    void render() {
        stroke(255, 255, 255, map(this.pos.y, 0, height, 255, 80));
        strokeWeight(this.r);
        point(this.pos.x, this.pos.y);
    }
    
}
