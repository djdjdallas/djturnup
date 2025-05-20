import styles from "../app/styles/Footer.module.css";

const Footer = () => {
  return (
    <footer className={styles.footer}>
      <div className={styles.footerContent}>
        <div className={styles.footerSection}>
          <h3>Mobile DJ LA</h3>
          <p>Professional DJ services in Los Angeles and surrounding areas</p>
          <p>Call: (818) 693-2296</p>
          <p>Email: dj.turnupmusic@gmail.com</p>
        </div>
        <div className={styles.footerSection}>
          <h4>Services</h4>
          <ul>
            <li>Weddings</li>
            <li>Corporate Events</li>
            <li>Private Parties</li>
            <li>Bar/Bat Mitzvahs</li>
          </ul>
        </div>
        <div className={styles.footerSection}>
          <h4>Contact</h4>
          <ul>
            <li>Los Angeles, CA</li>
            <li>(555) 123-4567</li>
            <li>info@djturnup.com</li>
          </ul>
        </div>
      </div>
      <div className={styles.footerBottom}>
        <p>&copy; 2024 Mobile DJ LA. All rights reserved.</p>
      </div>
    </footer>
  );
};

export default Footer;
