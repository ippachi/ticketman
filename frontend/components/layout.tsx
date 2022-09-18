import {ReactNode} from "react";
import {createClient, QueryClient, QueryClientProvider} from "../module/query";
import {Toaster} from "../module/toast";
import Drawer from "./drawer";
import Navbar from "./navbar";

export default function Layout({children}: {children: ReactNode}) {
  return <>
    <Drawer>
      <Navbar />
      <main className="container mx-auto px-8 mt-8">
        {children}
      </main>
    </Drawer>
    <Toaster position="bottom-right" />
  </>
}
