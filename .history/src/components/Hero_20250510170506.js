import styles from "../app/styles/Hero.module.css";

const Hero = () => {
  return (
    <div id="home" className={styles.hero}>
      {/* Hero background image */}
      <div className={styles.heroImage}>
        <img src="/d-hero.jpg" alt="DJ Turnup performing" />
      </div>

      {/* Dark overlay for better text readability */}
      <div className={styles.heroOverlay}></div>

      <div className={styles.heroContent}>
        <div className={styles.heroText}>
          <h1>TURN UP THE ENERGY</h1>
          <p>
            Los Angeles' Premier DJ bringing the beats that make your event
            unforgettable
          </p>
          <button className={styles.heroButton}>GET A QUOTE</button>
        </div>
      </div>
    </div>
  );
};

export default Hero;
