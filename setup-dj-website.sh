echo "Creating src/app/layout.js..."
cat > src/app/layout.js << 'EOF'
import './styles/globals.css'

export const metadata = {
  title: 'DJ Turnup - Los Angeles DJ Services',
  description: 'Professional DJ services in Los Angeles and surrounding areas',
}

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

# Create src/app/page.js
echo "Creating src/app/page.js..."
cat > src/app/page.js << 'EOF'
'use client'

import NavBar from '../components/NavBar';
import Hero from '../components/Hero';
import Services from '../components/Services';
import Features from '../components/Features';
import Contact from '../components/Contact';
import Footer from '../components/Footer';

export default function Home() {
  return (
    <div>
      <NavBar />
      <Hero />
      <Services />
      <Features />
      <Contact />
      <Footer />
    </div>
  );
}
EOF

# Create src/components/NavBar.js
echo "Creating src/components/NavBar.js..."
cat > src/components/NavBar.js << 'EOF'
'use client'

import React, { useState } from 'react';
import styles from '../app/styles/NavBar.module.css';

const NavBar = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <nav className={styles.navbar}>
      <div className={styles.navContainer}>
        <div className={styles.navLogo}>
          <h2>DJ TURNUP</h2>
        </div>
        <div className={styles.navToggle} onClick={() => setIsOpen(!isOpen)}>
          <span className={styles.bar}></span>
          <span className={styles.bar}></span>
          <span className={styles.bar}></span>
        </div>
        <ul className={`${styles.navMenu} ${isOpen ? styles.active : ''}`}>
          <li className={styles.navItem}>
            <a href="#home" className={styles.navLinks}>HOME</a>
          </li>
          <li className={styles.navItem}>
            <a href="#services" className={styles.navLinks}>SERVICES</a>
          </li>
          <li className={styles.navItem}>
            <a href="#about" className={styles.navLinks}>ABOUT</a>
          </li>
          <li className={styles.navItem}>
            <a href="#contact" className={styles.navLinks}>CONTACT</a>
          </li>
        </ul>
      </div>
    </nav>
  );
};

export default NavBar;
EOF

# Create src/components/Hero.js
echo "Creating src/components/Hero.js..."
cat > src/components/Hero.js << 'EOF'
import styles from '../app/styles/Hero.module.css';

const Hero = () => {
  return (
    <div id="home" className={styles.hero}>
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
EOF

# Create src/components/Services.js
echo "Creating src/components/Services.js..."
cat > src/components/Services.js << 'EOF'
import styles from '../app/styles/Services.module.css';

const Services = () => {
  const services = [
    {
      title: 'WEDDINGS',
      description: 'Making your special day unforgettable with the perfect soundtrack',
      image: '/wedding-dj.jpg'
    },
    {
      title: 'CORPORATE EVENTS',
      description: 'Professional entertainment for company parties and business functions',
      image: '/corporate-dj.jpg'
    },
    {
      title: 'PRIVATE PARTIES',
      description: 'Customized playlists for birthday parties, anniversaries, and celebrations',
      image: '/private-party-dj.jpg'
    },
    {
      title: 'BAR/BAT MITZVAHS',
      description: 'Creating memorable experiences for these important milestones',
      image: '/mitzvah-dj.jpg'
    }
  ];

  return (
    <div id="services" className={styles.services}>
      <h2 className={styles.servicesTitle}>OUR SERVICES</h2>
      <div className={styles.servicesGrid}>
        {services.map((service, index) => (
          <div key={index} className={styles.serviceCard}>
            <div className={styles.serviceImage}>
              <img src={service.image} alt={service.title} />
            </div>
            <div className={styles.serviceContent}>
              <h3>{service.title}</h3>
              <p>{service.description}</p>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Services;
EOF

# Create src/components/Features.js
echo "Creating src/components/Features.js..."
cat > src/components/Features.js << 'EOF'
import styles from '../app/styles/Features.module.css';

const Features = () => {
  const features = [
    {
      title: 'Elite Talent',
      description: 'Professional DJs with extensive experience in Los Angeles entertainment scene',
      icon: '⭐'
    },
    {
      title: 'Pro Setup & Execution',
      description: 'High-quality sound and interactive performance that keeps your guests entertained',
      icon: '⚙️'
    },
    {
      title: 'DJs for Any Occasion',
      description: 'Whether it\'s a wedding day, corporate gala, or birthday party, we have the perfect DJ',
      icon: '🎵'
    },
    {
      title: 'Custom Playlists',
      description: 'From hip-hop to EDM to Top 40 hits, we play all the songs you want to hear',
      icon: '🎧'
    }
  ];

  return (
    <div id="about" className={styles.features}>
      <h2 className={styles.featuresTitle}>Why Choose DJ Turnup?</h2>
      <div className={styles.featuresGrid}>
        {features.map((feature, index) => (
          <div key={index} className={styles.featureCard}>
            <div className={styles.featureIcon}>{feature.icon}</div>
            <h3>{feature.title}</h3>
            <p>{feature.description}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Features;
EOF

# Create src/components/Contact.js
echo "Creating src/components/Contact.js..."
cat > src/components/Contact.js << 'EOF'
'use client'

import { useState } from 'react';
import styles from '../app/styles/Contact.module.css';

const Contact = () => {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    phone: '',
    organization: '',
    eventDate: '',
    venue: '',
    eventType: '',
    services: []
  });

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;
    
    if (type === 'checkbox') {
      setFormData(prev => ({
        ...prev,
        services: checked 
          ? [...prev.services, value]
          : prev.services.filter(service => service !== value)
      }));
    } else {
      setFormData(prev => ({
        ...prev,
        [name]: value
      }));
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here you would typically send the form data to a server
    console.log('Form submitted:', formData);
    alert('Thank you for your inquiry! DJ Turnup will contact you soon.');
  };

  return (
    <div id="contact" className={styles.contact}>
      <h2 className={styles.contactTitle}>Request Event Information</h2>
      <form onSubmit={handleSubmit} className={styles.contactForm}>
        <div className={styles.formRow}>
          <div className={styles.formGroup}>
            <label htmlFor="firstName">First Name *</label>
            <input
              type="text"
              id="firstName"
              name="firstName"
              value={formData.firstName}
              onChange={handleChange}
              required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="lastName">Last Name *</label>
            <input
              type="text"
              id="lastName"
              name="lastName"
              value={formData.lastName}
              onChange={handleChange}
              required
            />
          </div>
        </div>

        <div className={styles.formRow}>
          <div className={styles.formGroup}>
            <label htmlFor="email">Email Address *</label>
            <input
              type="email"
              id="email"
              name="email"
              value={formData.email}
              onChange={handleChange}
              required
            />
          </div>
          <div className={styles.formGroup}>
            <label htmlFor="phone">Telephone *</label>
            <input
              type="tel"
              id="phone"
              name="phone"
              value={formData.phone}
              onChange={handleChange}
              required
            />
          </div>
        </div>

        <div className={styles.formGroup}>
          <label htmlFor="organization">Organization</label>
          <input
            type="text"
            id="organization"
            name="organization"
            value={formData.organization}
            onChange={handleChange}
          />
        </div>

        <div className={styles.formGroup}>
          <label htmlFor="eventDate">Date Of Event *</label>
          <input
            type="date"
            id="eventDate"
            name="eventDate"
            value={formData.eventDate}
            onChange={handleChange}
            required
          />
        </div>

        <div className={styles.formRow">
          <div className={styles.formGroup}>
            <label htmlFor="venue">Where Will Your Event Take Place? (Venue, City, State) *</label>
            <input
              type="text"
              id="venue"
              name="venue"
              value={formData.venue}
              onChange={handleChange}
              required
            />
          </div>
        </div>

        <div className={styles.formGroup}>
          <label htmlFor="eventType">Type of Event *</label>
          <select
            id="eventType"
            name="eventType"
            value={formData.eventType}
            onChange={handleChange}
            required
          >
            <option value="">Please select...</option>
            <option value="wedding">Wedding</option>
            <option value="corporate">Corporate Event</option>
            <option value="private">Private Party</option>
            <option value="mitzvah">Bar/Bat Mitzvah</option>
            <option value="other">Other</option>
          </select>
        </div>

        <div className={styles.formGroup}>
          <label>What Services Are You Looking For? *</label>
          <div className={styles.checkboxGroup}>
            {[
              { id: 'dj', value: 'DJ Services', label: 'DJ Services' },
              { id: 'lighting', value: 'Lighting', label: 'Lighting' },
              { id: 'photobooth', value: 'Photo Booth', label: 'Photo Booth' },
              { id: 'mc', value: 'MC Services', label: 'MC Services' }
            ].map(service => (
              <label key={service.id} className={styles.checkboxLabel}>
                <input
                  type="checkbox"
                  name="services"
                  value={service.value}
                  checked={formData.services.includes(service.value)}
                  onChange={handleChange}
                />
                {service.label}
              </label>
            ))}
          </div>
        </div>

        <button type="submit" className={styles.submitButton}>
          Submit Request
        </button>
      </form>
    </div>
  );
};

export default Contact;
EOF

# Create src/components/Footer.js
echo "Creating src/components/Footer.js..."
cat > src/components/Footer.js << 'EOF'
import styles from '../app/styles/Footer.module.css';

const Footer = () => {
  return (
    <footer className={styles.footer}>
      <div className={styles.footerContent}>
        <div className={styles.footerSection}>
          <h3>DJ TURNUP</h3>
          <p>Professional DJ services in Los Angeles and surrounding areas</p>
          <p>Call: (555) 123-4567</p>
          <p>Email: info@djturnup.com</p>
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
        <p>&copy; 2024 DJ Turnup. All rights reserved.</p>
      </div>
    </footer>
  );
};

export default Footer;
EOF

# Create src/app/styles/globals.css
echo "Creating src/app/styles/globals.css..."
cat > src/app/styles/globals.css << 'EOF'
html,
body {
  padding: 0;
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen,
    Ubuntu, Cantarell, Fira Sans, Droid Sans, Helvetica Neue, sans-serif;
  scroll-behavior: smooth;
}

* {
  box-sizing: border-box;
}

a {
  color: inherit;
  text-decoration: none;
}
EOF

# Create src/app/styles/NavBar.module.css
echo "Creating src/app/styles/NavBar.module.css..."
cat > src/app/styles/NavBar.module.css << 'EOF'
.navbar {
  background-color: #00c9c0;
  height: 80px;
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}

.navContainer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 80px;
  width: 100%;
  max-width: 1200px;
  padding: 0 24px;
}

.navLogo {
  color: white;
  cursor: pointer;
  font-size: 1.5rem;
  font-weight: bold;
}

.navMenu {
  display: flex;
  list-style: none;
  gap: 40px;
  margin: 0;
  padding: 0;
}

.navItem {
  height: 80px;
  display: flex;
  align-items: center;
}

.navLinks {
  color: white;
  font-weight: 500;
  text-decoration: none;
  padding: 0.5rem 1rem;
  transition: all 0.3s ease;
}

.navLinks:hover {
  color: #f0f0f0;
  background-color: rgba(255,255,255,0.1);
  border-radius: 4px;
}

.navToggle {
  display: none;
  flex-direction: column;
  cursor: pointer;
}

.bar {
  width: 25px;
  height: 3px;
  margin: 3px 0;
  transition: 0.3s;
  background-color: white;
}

@media screen and (max-width: 768px) {
  .navMenu {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: auto;
    position: absolute;
    top: 80px;
    left: -100%;
    opacity: 0;
    transition: all 0.5s ease;
    background-color: #00c9c0;
  }

  .navMenu.active {
    background: #00c9c0;
    left: 0;
    opacity: 1;
    transition: all 0.5s ease;
    z-index: 1;
  }

  .navItem {
    height: 60px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
  }

  .navToggle {
    display: flex;
  }
}
EOF

# Create src/app/styles/Hero.module.css
echo "Creating src/app/styles/Hero.module.css..."
cat > src/app/styles/Hero.module.css << 'EOF'
.hero {
  background: #DAA520;
  color: white;
  height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  margin-top: 80px;
}

.heroContent {
  text-align: center;
  z-index: 2;
  max-width: 1200px;
  padding: 0 24px;
}

.heroText h1 {
  font-size: 4rem;
  margin-bottom: 1rem;
  text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
  font-weight: bold;
}

.heroText p {
  font-size: 1.25rem;
  margin-bottom: 2rem;
  opacity: 0.9;
}

.heroButton {
  padding: 14px 32px;
  font-size: 1.1rem;
  background-color: white;
  color: #DAA520;
  border: none;
  border-radius: 30px;
  cursor: pointer;
  font-weight: 600;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

.heroButton:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0,0,0,0.3);
  background-color: #f5f5f5;
}

@media screen and (max-width: 768px) {
  .heroText h1 {
    font-size: 2.5rem;
  }
  
  .heroText p {
    font-size: 1rem;
  }
}
EOF

# Create src/app/styles/Services.module.css
echo "Creating src/app/styles/Services.module.css..."
cat > src/app/styles/Services.module.css << 'EOF'
.services {
  padding: 100px 24px;
  max-width: 1200px;
  margin: 0 auto;
}

.servicesTitle {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 60px;
  color: #333;
}

.servicesGrid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 30px;
}

.serviceCard {
  background: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  transition: transform 0.3s ease;
}

.serviceCard:hover {
  transform: translateY(-5px);
}

.serviceImage {
  height: 250px;
  overflow: hidden;
}

.serviceImage img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.serviceContent {
  padding: 30px;
}

.serviceContent h3 {
  font-size: 1.5rem;
  margin-bottom: 10px;
  color: #333;
}

.serviceContent p {
  color: #666;
  line-height: 1.6;
}
EOF

# Create src/app/styles/Features.module.css
echo "Creating src/app/styles/Features.module.css..."
cat > src/app/styles/Features.module.css << 'EOF'
.features {
  background-color: #f8f9fa;
  padding: 100px 24px;
}

.featuresTitle {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 60px;
  color: #333;
}

.featuresGrid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 40px;
  max-width: 1200px;
  margin: 0 auto;
}

.featureCard {
  text-align: center;
  background: white;
  padding: 40px 20px;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.05);
  transition: transform 0.3s ease;
}

.featureCard:hover {
  transform: translateY(-5px);
}

.featureIcon {
  font-size: 3rem;
  margin-bottom: 20px;
}

.featureCard h3 {
  font-size: 1.3rem;
  margin-bottom: 15px;
  color: #333;
}

.featureCard p {
  color: #666;
  line-height: 1.6;
  margin: 0;
}
EOF

# Create src/app/styles/Contact.module.css
echo "Creating src/app/styles/Contact.module.css..."
cat > src/app/styles/Contact.module.css << 'EOF'
.contact {
  padding: 100px 24px;
  max-width: 800px;
  margin: 0 auto;
}

.contactTitle {
  text-align: center;
  font-size: 2.5rem;
  margin-bottom: 50px;
  color: #333;
}

.contactForm {
  background: white;
  padding: 40px;
  border-radius: 10px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.formRow {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 20px;
}

.formGroup {
  margin-bottom: 20px;
}

.formGroup label {
  display: block;
  margin-bottom: 8px;
  color: #333;
  font-weight: 500;
}

.formGroup input,
.formGroup select {
  width: 100%;
  padding: 12px;
  border: 1px solid #ddd;
  border-radius: 5px;
  font-size: 1rem;
}

.formGroup input:focus,
.formGroup select:focus {
  outline: none;
  border-color: #00c9c0;
}

.checkboxGroup {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 10px;
  margin-top: 10px;
}

.checkboxLabel {
  display: flex;
  align-items: center;
  gap: 8px;
  cursor: pointer;
}

.checkboxLabel input[type="checkbox"] {
  width: auto;
}

.submitButton {
  background-color: #9B59B6;
  color: white;
  border: none;
  padding: 15px 40px;
  font-size: 1.1rem;
  border-radius: 30px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: block;
  margin: 30px auto 0;
  font-weight: 600;
}

.submitButton:hover {
  background-color: #8E44AD;
  transform: translateY(-2px);
}

@media screen and (max-width: 768px) {
  .formRow {
    grid-template-columns: 1fr;
  }
  
  .contactForm {
    padding: 30px;
  }
}
EOF

# Create src/app/styles/Footer.module.css
echo "Creating src/app/styles/Footer.module.css..."
cat > src/app/styles/Footer.module.css << 'EOF'
.footer {
  background-color: #333;
  color: white;
  padding: 60px 24px 20px;
}

.footerContent {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 40px;
  max-width: 1200px;
  margin: 0 auto;
  margin-bottom: 40px;
}

.footerSection h3,
.footerSection h4 {
  margin-bottom: 20px;
}

.footerSection ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footerSection li {
  margin-bottom: 10px;
  color: #ccc;
}

.footerBottom {
  text-align: center;
  padding-top: 30px;
  border-top: 1px solid #555;
  color: #ccc;
  max-width: 1200px;
  margin: 0 auto;
}
EOF

# Create placeholder image files in public directory
echo "Creating placeholder image files..."
touch public/wedding-dj.jpg
touch public/corporate-dj.jpg
touch public/private-party-dj.jpg
touch public/mitzvah-dj.jpg

echo "All files have been created successfully!"
echo ""
echo "Next steps:"
echo "1. Replace placeholder images in /public with actual DJ photos"
echo "2. Update contact information (phone and email)"
echo "3. Set up a backend service for form submissions"
echo "4. Run 'npm run dev' to start the development server"