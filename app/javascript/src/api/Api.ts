import axios, { AxiosInstance } from 'axios';

interface Config {
  timeout: number;
  headers: Headers;
  validateStatus: (status: number) => boolean;
  baseURL: string;
}

interface Headers {
  Accept: string;
  'Content-Type': string;
}

export class Api {
  baseConfig: Config;

  baseHeaders: Headers;

  baseUrl: string;

  utility: AxiosInstance;

  constructor() {
    this.baseHeaders = {
      Accept: 'application/json',
      'Content-Type': 'application/json',
    };

    this.baseUrl = this.setBaseUrl();

    this.baseConfig = {
      baseURL: this.baseUrl,
      timeout: 60000,
      headers: this.baseHeaders,
      validateStatus: (status: number) => {
        return status >= 200 && status < 300;
      },
    };

    this.utility = axios.create(this.baseConfig);
  }

  setAuthUtility(authToken: string) {
    this.utility.defaults.headers.common.Authorization = authToken;
  }

  setBaseUtility() {
    this.utility.defaults.headers.common.Authorization = undefined;
  }

  setBaseUrl() {
    if (process.env.NODE_ENV && process.env.NODE_ENV === 'production') {
      return process.env.APPLICATION_URL;
    } else {
      return 'http://localhost:3000';
    }
  }
}

const api = new Api();

export default api;
