#!/bin/bash

# Update Hero component with new tagline
echo "Updating Hero component with new tagline..."
cat > src/components/Hero.js << 'EOF'
import styles from '../app/styles/Hero.module.css';

const Hero = () => {
  return (
    <div id="home" className={styles.hero}>
      {/* Hero background image */}
      <div className={styles.heroImage}>
        <img src="/hero-dj.jpg" alt="DJ Turnup performing" />
      </div>
      
      {/* Dark overlay for better text readability */}
      <div className={styles.heroOverlay}></div>
      
      <div className={styles.heroContent}>
        <div className={styles.heroText}>
          <h1>TURN UP THE ENERGY</h1>
          <p>Los Angeles' Premier DJ bringing the beats that make your event unforgettable</p>
          <button className={styles.heroButton}>GET A QUOTE</button>
        </div>
      </div>
    </div>
  );
};

export default Hero;
EOF

echo "✅ Hero component updated with new tagline: 'TURN UP THE ENERGY'"
echo ""
echo "Other great options you can use:"
echo "- 'ELEVATE YOUR EVENT'"
echo "- 'WHERE MUSIC MEETS MAGIC'"
echo "- 'LOS ANGELES' PREMIER DJ'"
echo "- 'PARTY REVOLUTION STARTS HERE'"
echo "- 'UNFORGETTABLE BEATS'"
echo ""
echo "To change it, just edit the h1 text in src/components/Hero.js"
echo "Run 'npm run dev' to see the updated tagline!"