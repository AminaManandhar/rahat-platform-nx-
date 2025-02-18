import { UUID } from "crypto";
import { ProjectStatus } from "../enums";

export type ProjectActions = {
    action: string;
    payload?: any;
}

export type Project = {
    uuid?: UUID;
    name?: string;
    description?: string;
    status?: ProjectStatus
    type?: string;
    contractAddress?: string;
    extras?: JSON;
    createdAt?: Date;
    updatedAt?: Date;
    deletedAt?: Date;
}