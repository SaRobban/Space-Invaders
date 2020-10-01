// Jonatan

boolean rectangleCollision(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
	return x1 < x2 + w2 &&  // left1 < right2
	       x1 + w1 > x2 &&  // right1 > left2
	       y1 < y2 + h2 &&  // top1 < bottom2
	       y1 + h1 > y2;    // bottom1 > top2
}
