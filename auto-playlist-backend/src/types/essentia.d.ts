declare global {
  interface Window {
    webkitAudioContext: typeof AudioContext
  }

  namespace globalThis {
    const webkitAudioContext: typeof AudioContext
  }
}

declare module 'essentia.js/dist/essentia-wasm.es.js' {
  export function EssentiaWASM(): Promise<unknown>
  export default function EssentiaWASM(): Promise<unknown>
}

declare module 'essentia.js/dist/essentia.js-core.es.js' {
  interface Vector {
    delete(): void
  }

  export default class Essentia {
    constructor(wasmModule: unknown)
    version: string
    algorithmNames: string[]

    arrayToVector(array: Float32Array): Vector
    vectorToArray(vector: Vector): number[]

    RMS(signal: Vector): { rms: number }
    SpectralCentroid(signal: Vector): { spectralCentroid: number }
    ZeroCrossingRate(signal: Vector): { zeroCrossingRate: number }
    MFCC(signal: Vector): { mfcc: number[] }
    SpectralRolloff(signal: Vector): { spectralRolloff: number }
    SpectralFlux(signal1: Vector, signal2: Vector): { spectralFlux: number }

    getAudioBufferFromURL(
      url: string,
      audioContext: AudioContext
    ): Promise<AudioBuffer>
    shutdown(): void
    delete(): void
  }
}
