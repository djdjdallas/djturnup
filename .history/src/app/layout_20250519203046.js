import "./styles/globals.css";

export const metadata = {
  title: "Mobile DJ LA - Los Angeles DJ Services",
  description: "Professional DJ services in Los Angeles and surrounding areas",
};
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}
