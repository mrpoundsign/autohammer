declare global {
    interface IQuickbarSetHandler {
        // Set is expected to return false if the handler cannot set the quickbar item
        set(quickbarIndex: number, index: number, entityID: EntityID, curr: EntityID): boolean;
    }
}

class QuickbarHandler {
    // array of quickbarsethandlers
    quickbarSetHandlers: Array<IQuickbarSetHandler> = [];

    // register quickbar set handler
    registerQuickbarSetHandler(handler: IQuickbarSetHandler) {
        this.quickbarSetHandlers.push(handler);
    }

    // QuickbarSet is expected to return false if the handler cannot set the quickbar item
    QuickbarSet(quickbarIndex: number, index: number, entityID: EntityID, curr: EntityID): boolean {
        for (let handler of this.quickbarSetHandlers) {
            if (!handler.set(quickbarIndex, index, entityID, curr)) {
                return false;
            }
        }

        return true;
    }
}

const AHQuickbar = new QuickbarHandler();

export { AHQuickbar, IQuickbarSetHandler };