/* eslint-disable @typescript-eslint/no-unsafe-return */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */
/* eslint-disable @typescript-eslint/explicit-function-return-type */
/* eslint-disable @typescript-eslint/no-unsafe-argument */

import Error from "next/error";
import React from "react"

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasNotFoundError: false };
  }

  static getDerivedStateFromError(error) {
    // Update state so the next render will show the fallback UI.
    if (error.response.errors[0].extensions.code === "NOT_FOUND") {
      return { hasNotFoundError: true };
    } else {
      return { hasNotFoundError: false };
    }
  }
  componentDidCatch(_error, _errorInfo) {
    // You can also log the error to an error reporting service
    // logErrorToMyService(error, errorInfo);
    // console.log(error)
  }
  render() {
    if (this.state.hasNotFoundError) {
      // You can render any custom fallback UI
      return <Error statusCode={404}/>
    }
    return this.props.children;
  }
}

export default ErrorBoundary;
