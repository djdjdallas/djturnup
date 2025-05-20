"use client";

import { useState } from "react";
import styles from "../app/styles/Contact.module.css";

const Contact = () => {
  const [formData, setFormData] = useState({
    firstName: "",
    lastName: "",
    email: "",
    phone: "",
    organization: "",
    eventDate: "",
    venue: "",
    eventType: "",
    services: [],
  });

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;

    if (type === "checkbox") {
      setFormData((prev) => ({
        ...prev,
        services: checked
          ? [...prev.services, value]
          : prev.services.filter((service) => service !== value),
      }));
    } else {
      setFormData((prev) => ({
        ...prev,
        [name]: value,
      }));
    }
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Here you would typically send the form data to a server
    console.log("Form submitted:", formData);
    alert("Thank you for your inquiry! DJ Turnup will contact you soon.");
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

        <div className={styles.formRow}>
          <div className={styles.formGroup}>
            <label htmlFor="venue">
              Where Will Your Event Take Place? (Venue, City, State) *
            </label>
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
              { id: "dj", value: "DJ Services", label: "DJ Services" },
              { id: "lighting", value: "Lighting", label: "Lighting" },
              { id: "photobooth", value: "Photo Booth", label: "Photo Booth" },
              { id: "mc", value: "MC Services", label: "MC Services" },
            ].map((service) => (
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
// dj.turnupmusic@gmail.com
