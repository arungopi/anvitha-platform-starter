
/**
 * File: EnvHelper.ts
 * Description: Environment variable helper functions
 * Author: Arun Gopi
 * Date: 2026-11-23
 */

import { ConsoleLogger } from "@/infrastructure/services/ConsoleLogger";

const consoleLogger = new ConsoleLogger();


export const requireEnv = (name: string): string => {
  const value = process.env[name];
  if (!value) {
    consoleLogger.error(`Missing ${name}`);
    throw new Error(`Missing ${name}`);
  }
  return value;
}