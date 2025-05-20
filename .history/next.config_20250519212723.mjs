/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: [], // Add any external domains you might use for images
    unoptimized: process.env.NODE_ENV !== "production", // Use unoptimized images in development
  },
};

module.exports = nextConfig;
