// src/components/Contact.js
"use client";

import { useState } from "react";
import styles from "../app/styles/Contact.module.css";
import emailjs from "emailjs-com";

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

  const [isSubmitting, setIsSubmitting] = useState(false);
  const [submitStatus, setSubmitStatus] = useState(null);

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
    setIsSubmitting(true);
    setSubmitStatus(null);

    // Format the services array into a string for email
    const formattedData = {
      ...formData,
      services: formData.services.join(", "),
    };

    // Replace these with your actual EmailJS credentials from your account
    const serviceID = "service_6qsconv"; // Get this from EmailJS dashboard
    const templateID = "template_lw4zxyp"; // Get this from EmailJS dashboard
    const userID = "-3erqZOf1mSXV6Lam"; // Get this from EmailJS dashboard (also called "Public Key")

    emailjs
      .send(serviceID, templateID, formattedData, userID)
      .then((response) => {
        console.log("Form submitted successfully!", response);
        setSubmitStatus("success");
        // Reset form after successful submission
        setFormData({
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
      })
      .catch((error) => {
        console.error("Form submission error:", error);
        setSubmitStatus("error");
      })
      .finally(() => {
        setIsSubmitting(false);
      });
  };

  return (
    <div id="contact" className={styles.contact}>
      <h2 className={styles.contactTitle}>Request Event Information</h2>

      {submitStatus === "success" && (
        <div
          className={`${styles.statusMessage || ""} ${
            styles.successMessage || ""
          }`}
          style={{
            padding: "15px",
            backgroundColor: "#d4edda",
            color: "#155724",
            borderRadius: "5px",
            marginBottom: "20px",
          }}
        >
          <p>Thank you for your inquiry! Mobile DJ LA will contact you soon.</p>
        </div>
      )}

      {submitStatus === "error" && (
        <div
          className={`${styles.statusMessage || ""} ${
            styles.errorMessage || ""
          }`}
          style={{
            padding: "15px",
            backgroundColor: "#f8d7da",
            color: "#721c24",
            borderRadius: "5px",
            marginBottom: "20px",
          }}
        >
          <p>
            There was an error submitting your request. Please try again or
            contact us directly at info@mobiledj.la
          </p>
        </div>
      )}

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
              disabled={isSubmitting}
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
              disabled={isSubmitting}
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
              disabled={isSubmitting}
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
              disabled={isSubmitting}
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
            disabled={isSubmitting}
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
            disabled={isSubmitting}
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
              disabled={isSubmitting}
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
            disabled={isSubmitting}
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
                  disabled={isSubmitting}
                />
                {service.label}
              </label>
            ))}
          </div>
        </div>

        <button
          type="submit"
          className={styles.submitButton}
          disabled={isSubmitting}
        >
          {isSubmitting ? "Sending..." : "Submit Request"}
        </button>
      </form>
    </div>
  );
};

export default Contact;
// dj.turnupmusic@gmail.com
