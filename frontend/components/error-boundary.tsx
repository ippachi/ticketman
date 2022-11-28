/* eslint-disable @typescript-eslint/no-explicit-any */
/* eslint-disable @typescript-eslint/no-unsafe-member-access */

import Error from "next/error";
import React, { ReactNode } from "react";

type State = { hasNotFoundError: boolean }

class ErrorBoundary extends React.Component {
  readonly props!: { children: ReactNode };
  readonly state: State;

  constructor(props: { children: JSX.Element }) {
    super(props);
    this.state = { hasNotFoundError: false };
  }

  static getDerivedStateFromError(error: any): State {
    // Update state so the next render will show the fallback UI.
    if (error.response.errors[0].extensions.code === "NOT_FOUND") {
      return { hasNotFoundError: true };
    } else {
      return { hasNotFoundError: false };
    }
  }
  componentDidCatch(): void {
    // You can also log the error to an error reporting service
    // logErrorToMyService(error, errorInfo);
    // console.log(error)
  }
  render(): ReactNode {
    if (this.state.hasNotFoundError) {
      // You can render any custom fallback UI
      return <Error statusCode={404} />;
    }
    return this.props.children;
  }
}

export default ErrorBoundary;
