import React from "react";
import { render } from "@testing-library/react";
import { Toaster } from "@/module/toast";

const AllTheProviders = ({ children }: { children: JSX.Element }): JSX.Element => {
  return (
    <>
      {children}
      <Toaster />
    </>
  );
};

const customRender = (ui: JSX.Element): unknown => render(ui, { wrapper: AllTheProviders });

// re-export everything
export * from "@testing-library/react";

// override render method
export { customRender as render };
