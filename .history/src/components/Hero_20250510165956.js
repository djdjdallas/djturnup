// src/components/Hero.js
import styles from "../app/styles/Hero.module.css";

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
          <h1>GET IN THE GROOVE</h1>
          <p>Professional DJ services in Los Angeles and surrounding areas</p>
          <button className={styles.heroButton}>GET A QUOTE</button>
        </div>
      </div>
    </div>
  );
};

export default Hero;
