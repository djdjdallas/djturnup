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
