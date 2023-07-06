export function replaceWith(str: string | any, replaceWith: string): any {
  return str
    .trim()
    .toUpperCase()
    .replace(/[-\s]+/g, replaceWith);
}

export function hexStringToBuffer(str: string): Buffer {
  return Buffer.from(str.substring(2), 'hex');
}

export const stringifyWithBigInt = (obj: any): any => {
  const jsonString = JSON.stringify(obj, (key, value) => {
    if (typeof value === 'bigint') {
      return value.toString(); // Convert BigInt to string
    }
    return value; // Return other values unchanged
  });

  return JSON.parse(jsonString); // Parse the stringified JSON
};
