"use client";

import React, { useState } from "react";
import Image from "next/image";
import styles from "../app/styles/NavBar.module.css";

const NavBar = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className={styles.navbar}>
      <div className={styles.navContainer}>
        <div className={styles.navLogo}>
          {/* Logo and text combined */}
          <a href="#home" className={styles.logoLink}>
            <div className={styles.logoWrapper}>
              <Image
                src="/logo.jpg"
                alt="Mobile DJ LA Logo"
                width={60}
                height={60}
                className={styles.logoImage}
                priority
              />
              <h2>MOBILE DJ LA</h2>
            </div>
          </a>
        </div>
        <div className={styles.navToggle} onClick={() => setIsOpen(!isOpen)}>
          <span className={styles.bar}></span>
          <span className={styles.bar}></span>
          <span className={styles.bar}></span>
        </div>
        <ul className={`${styles.navMenu} ${isOpen ? styles.active : ""}`}>
          <li className={styles.navItem}>
            <a href="#home" className={styles.navLinks}>
              HOME
            </a>
          </li>
          <li className={styles.navItem}>
            <a href="#services" className={styles.navLinks}>
              SERVICES
            </a>
          </li>
          <li className={styles.navItem}>
            <a href="#about" className={styles.navLinks}>
              ABOUT
            </a>
          </li>
          <li className={styles.navItem}>
            <a href="#contact" className={styles.navLinks}>
              CONTACT
            </a>
          </li>
        </ul>
      </div>
    </nav>
  );
};

export default NavBar;
